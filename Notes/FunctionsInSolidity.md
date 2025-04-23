# 📘 Functions in Solidity

## 🔨 Constructor

```solidity
bool public isOpen;

constructor() {
    isOpen = true;
}
```

- The **constructor** is a special function that runs **only once**, during contract deployment.
- Used to set **initial values** for state variables.

### Passing Arguments to Constructor

```solidity
bool public isOpen;

constructor(bool _isOpen) {
    isOpen = _isOpen;
}
```

- You can pass arguments to a constructor.
- Using an underscore (e.g., `_isOpen`) helps avoid **variable shadowing** (when parameter names collide with storage variables).

---

## 🔁 Contract Functions

```solidity
function myFunction() external {
    // do something!
}
```

- Functions in Solidity can be invoked by **EOAs** or **other contracts**.
- `external` functions can be accessed from outside the contract.
- Prefer `external` over `public` for gas optimization when the function is only called externally.

---

## 🔄 Returning Values

```solidity
contract Contract {
    bool _isRunning = true;

    function isRunning() external view returns(bool) {
        return _isRunning;
    }
}
```

- Use `returns(<type>)` to specify return type.
- Use `view` to **guarantee no state modification**.
- Read-only functions can read but not write to the blockchain.

---

## 🧪 Using `console.log` for Debugging

```solidity
import "forge-std/console.sol";

contract C {
    function x() external {
        if (condition) {
            console.log("condition was met!");
        }
    }
}
```

- Provided by **Foundry** via `forge-std`.
- Use `console.log` to print logs during testing.
- Don’t forget to import the library at the top.

---

## 🧼 Pure Functions

```solidity
function double(uint x, uint y) external pure returns(uint) {
    return x + y;
}
```

- `pure` functions do **not read or write** any state.
- Use for simple calculations.

### Alternative Syntax

```solidity
function double(uint x, uint y) external pure returns(uint sum) {
    sum = x + y;
}
```

- Named return variables (`sum`) can be implicitly returned.

---

## ➕ Overloading Functions

```solidity
function add(uint x, uint y) external pure returns(uint) {
    return x + y;
}

function add(uint x, uint y, uint z) external pure returns(uint) {
    return x + y + z;
}
```

- Solidity supports **function overloading**.
- The function invoked depends on the **number and types** of arguments.

---

## 🔁 Returning Multiple Values

```solidity
function addTwo(uint x, uint y) external pure returns(uint, uint) {
    return (x + 2, y + 2);
}
```

- Functions can return **multiple values** as a **tuple**.

### Tuple Destructuring

```solidity
(uint x, uint y) = addTwo(4, 8);
console.log(x); // 6
console.log(y); // 10
```

- Useful for returning and assigning multiple values at once.
- Tuple elements can have **different data types**.
