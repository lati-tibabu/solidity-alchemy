# Solidity Structs Overview

- Structs group multiple variables under a single custom type.
- They can be stored in different data locations: `memory`, `storage`, or `calldata`.
- Structs can be nested inside other structs, arrays, or mappings for complex data structures.

---

## Example: Defining a Struct

```solidity
struct User {
    bool isActive;
    uint balance;
}

// Create a new User instance
User user = User(true, 0);
```

---

## Grouping Variables with Structs

Use structs to logically group related data within a contract.

```solidity
contract Escrow {
    struct Agreement {
        address depositor;
        address beneficiary;
        address arbiter;
        uint paymentAmount;
    }

    Agreement agreement;

    constructor(Agreement memory _agreement) {
        agreement = _agreement;
    }
}
```

---

## Modeling Structured Data

Structs are effective for modeling real-world entities in smart contracts.

```solidity
contract Marketplace {
    enum OrderStatus { Created, Paid, Shipped, Completed }

    struct Order {
        address buyer;
        address seller;
        uint256 amount;
        OrderStatus status;
    }

    Order[] public orders;
}
```

---

## Key Takeaways

- Use structs to group related variables into a single type.
- Combine structs with enums for more descriptive data models.
- Structs can be nested and stored in arrays, mappings, or other structs.
- Support for different storage locations: `memory`, `storage`, and `calldata`.

