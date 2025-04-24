# Sending Ether in Solidity

## 1. Storing the Owner

### 🎯 Goal

- Create a public state variable `owner`.
- Assign the deployer's address (`msg.sender`) to `owner` in the constructor.

### 🧠 Key Concepts

- **Solidity Address**: 160-bit (40-character) hexadecimal.
- **`msg.sender`**: Address initiating the current transaction or call.

### 📦 Solidity Example

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
}
```

### 🧾 Use Case

- Common for identifying contract administrators.
- Be cautious: central ownership can challenge decentralization principles.

---

## 2. Ethereum Messages

### 📬 What are Messages?

- Messages are interactions between contracts or from EOAs to contracts.
- Encoded in transactions as `calldata`.

### 🔍 Message Globals in Solidity

| Variable     | Type      | Description                                                |
| ------------ | --------- | ---------------------------------------------------------- |
| `msg.data`   | `bytes`   | Full calldata                                              |
| `msg.sender` | `address` | Origin of the call                                         |
| `msg.sig`    | `bytes4`  | First 4 bytes of the Keccak-256 hash of function signature |
| `msg.value`  | `uint`    | Amount of wei sent with the call                           |

---

## 3. Receiving Ether

### 🧠 Key Points

- Contracts cannot accept Ether by default.
- Use `payable` modifier to receive Ether.
- To receive Ether without calling a specific function, use `receive()` or a `fallback()` function.

### 🧪 Example: Payable Function

```solidity
contract Contract {
    function pay() public payable {
        console.log(msg.value); // Amount sent in wei
    }
}
```

### 🧪 Example: `receive()` Function

```solidity
contract Contract {
    receive() external payable {
        console.log(msg.value); // Ether received
    }
}
```

#### ✅ Requirements for `receive()`

- Must be `external`
- Must be `payable`
- Cannot accept arguments or return values

---

## 4. External Visibility

### ✍️ Definition

- `external` functions are called from other contracts or EOAs via message calls.
- They do not access memory directly like `internal` functions.

### 💡 Why `external` for `receive()`?

- It is triggered by a message call when no function matches the calldata.

---

## 5. Fallback Function

### 🔄 What is it?

- A default function called when:
  - No matching function signature is found.
  - Calldata is empty but no `receive()` exists.

### 🧪 Example

```solidity
contract Contract {
    fallback() external {
        // fallback logic
    }
}
```

#### ✅ Requirements

- Must be `external`
- No arguments or return values
- Can be `payable`, but not required

#### 📌 Usage

- Handling unexpected calldata or misspelled function calls.
- Can optionally accept Ether if `payable`.

---

## 6. Transferring Ether

### 🧪 Example: Tipping the Owner

You can make any function `payable` and use it to transfer Ether to stored addresses such as `owner` or `charity`.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;

        uint256 balance = address(this).balance;
        (bool s,) = charity.call{value: balance}("");
        require(s);
        selfdestruct(payable(owner));
    }
}
```

---

## ✅ Summary

| Feature      | Description                                    |
| ------------ | ---------------------------------------------- |
| `payable`    | Enables Ether reception in a function          |
| `receive()`  | Triggered by plain Ether transfer with no data |
| `fallback()` | Triggered by unmatched or malformed calldata   |
| `msg.sender` | Captures caller address                        |
| `msg.value`  | Amount of Ether sent                           |

Make sure to handle Ether and permissions securely to avoid vulnerabilities in smart contract design.
