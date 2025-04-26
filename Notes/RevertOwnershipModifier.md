# **Revert, Ownership, and Modifiers in Solidity**

## 1. Reverting Transactions

In Solidity, transaction reversion uses the EVM `REVERT` opcode. There are three main ways to revert:

- `assert(condition)` – internal errors and invariants (reverts with `Panic(uint256)`).
- `require(condition, "Error message")` – checks external inputs and conditions.
- `revert("Error message")` or `revert CustomError(arguments)` – immediately reverts, optionally using custom errors for gas optimization.

**Important points:**

- `require` takes a boolean condition and optional message.
- `revert` is unconditional and should be used inside an `if` check.
- Custom errors (`error MyError(args)`) are more gas-efficient than string messages.

**Best Practice:** Prefer custom errors for better gas efficiency and clarity.

## 2. Constructor Revert: Requiring 1 Ether

You can force users to send exactly 1 Ether when deploying the contract by making the constructor `payable` and checking `msg.value`:

```solidity
constructor() payable {
    require(msg.value == 1 ether, "Must send exactly 1 Ether");
    owner = msg.sender;
}
```

- **msg.value** represents the amount of wei sent with the call.
- **ether units** like `1 ether` are globally available in Solidity.

## 3. Restricting Functions to Specific Addresses (Only Owner Pattern)

You can restrict access to functions by comparing `msg.sender` to a known address:

```solidity
if (msg.sender != owner) {
    revert NotItemCreator(msg.sender);
}
```

Example use case: only allowing the deployer (owner) to withdraw contract funds.

**Withdraw Function Example:**

```solidity
function withdraw() public {
    require(msg.sender == owner, "Not the owner");
    (bool success, ) = owner.call{value: address(this).balance}("");
    require(success, "Transfer failed");
}
```

- Securely transfers all funds to the deployer.
- Checks that only the owner can call the `withdraw` function.

## 4. Function Modifiers for Access Control

Function modifiers allow injecting code _before_ and _after_ function execution:

```solidity
modifier onlyOwner {
    require(msg.sender == owner, "Not the owner");
    _;
}
```

- The `_` symbol is a placeholder for where the modified function’s body will execute.
- Example execution order for a modifier:
  - Modifier pre-body logic (e.g., `require`).
  - Function body execution.
  - Modifier post-body logic (if any).

**Example with Logging:**

```solidity
modifier logModifier {
    console.log("before");
    _;
    console.log("after");
}
```

Calling a function decorated with `logModifier` would log:

```
before
during
after
```

## Summary

- Use `require` for condition checks, `revert` for explicit failures, and `assert` for internal invariants.
- Secure critical functions like `withdraw` using owner checks.
- Modifiers encapsulate access control logic, making code cleaner and safer.
- Prefer custom errors over string literals for better gas efficiency.
