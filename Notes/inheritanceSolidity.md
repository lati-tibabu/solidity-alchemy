# 🚀 Inheritance in Solidity

- 🧱 Easily **re-use** common patterns and standards.
- 🏗️ **Child contracts** inherit all **functions** (except those marked `private`) and **state variables**.
- 🧰 Inherited access also includes **enums**, **structs**, **errors**, and **events**.
- 🔩 **Extend** or **override** inherited functionality as needed.

---

## 🔐 The `onlyOwner` Pattern

A common pattern for access control:

```solidity
contract Example {
    address owner = msg.sender;
    uint importantVar;

    error NotTheOwner();

    modifier onlyOwner {
        if (msg.sender != owner) {
            revert NotTheOwner();
        }
        _;
    }

    function privilegedMethod(uint x) external onlyOwner {
        importantVar = x;
    }
}
```

---

## 🧩 Modular Design: Separating Ownership

Organize your code into reusable modules:

```solidity
contract Ownable {
    address owner = msg.sender;

    error NotTheOwner();

    modifier onlyOwner {
        if (msg.sender != owner) {
            revert NotTheOwner();
        }
        _;
    }
}

contract Example is Ownable {
    uint importantVar;

    function privilegedMethod(uint x) external onlyOwner {
        importantVar = x;
    }
}
```

---

## 📦 Import Statements

Use `import` to reuse modules instead of copy-pasting code:

```solidity
import "./Ownable.sol";

contract Example is Ownable {
    uint importantVar;

    function privilegedMethod(uint x) external onlyOwner {
        importantVar = x;
    }
}
```

---

## 🛠️ Inheriting Functions

Functions are inherited too! Here's how to create an upgradable `transferOwner` function:

```solidity
contract Ownable {
    address owner = msg.sender;

    error NotTheOwner();

    modifier onlyOwner {
        if (msg.sender != owner) {
            revert NotTheOwner();
        }
        _;
    }

    // Mark function as virtual to allow overrides
    function transferOwner(address newOwner) public virtual onlyOwner {
        owner = newOwner;
    }
}
```

---

## ✨ Overriding Functions

Override inherited functions to extend or customize behavior:

```solidity
import "./Ownable.sol";

contract Example is Ownable {
    event TransferOwnership(address oldOwner, address newOwner);

    // Override the virtual function from Ownable
    function transferOwner(address newOwner) public override onlyOwner {
        address oldOwner = owner;
        super.transferOwner(newOwner);
        emit TransferOwnership(oldOwner, newOwner);
    }
}
```
