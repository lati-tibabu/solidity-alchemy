# Solidity Mappings Overview

- Key/value hash lookup data structure.
- Can only exist in **storage**, not in `memory` or `calldata`.
- Cannot be passed directly as a function argument or returned from a function.

---

## Example: Basic Mapping

```solidity
mapping(address => bool) isMember;

function join() external {
    isMember[msg.sender] = true;
}

function belongs() external view returns (bool) {
    return isMember[msg.sender];
}
```

---

## Combining Mappings with Other Types

Mappings can be combined with structs, arrays, and other mappings to create more advanced data models.

```solidity
// Mapping to a struct
mapping(address => User) users;

// Mapping to an array of structs
mapping(address => Order[]) ordersByAddress;

// Mapping an ID to a boolean
mapping(uint256 => bool) allowedIds;

// Mapping inside a struct
struct Person {
    mapping(uint256 => Vote) proposalVotes;
}
```

---

## Nested Mappings in Structs

**Important:** You cannot create a struct containing a mapping in `memory` — it must be built directly in `storage`.

```solidity
contract X {
    struct Proposal {
        bytes data;
        address target;
        mapping(address => bool) votes;
    }

    Proposal[] proposals;

    function newProposal(bytes memory data, address target) external {
        // Cannot do this:
        // Proposal memory proposal = Proposal(data, target);

        // Correct: build in storage
        Proposal storage proposal = proposals.push();
        proposal.data = data;
        proposal.target = target;
    }
}
```

---

## How Mappings Work in Storage

Mappings rely on hashing to locate storage slots. The value is stored at `keccak256(key . slot)`.

```solidity
contract X {
    mapping(address => bool) isMember; // stored at slot 0x0

    function join() external {
        // Writes to keccak256(msg.sender . 0x0)
        isMember[msg.sender] = true;
    }

    function belongs() external view returns (bool) {
        // Reads from keccak256(msg.sender . 0x0)
        return isMember[msg.sender];
    }
}
```

---

## Key Points

- Mappings are efficient for constant-time lookups.
- Can only be used in `storage`.
- Cannot be passed or returned in function calls.
- Nested mappings within structs require careful handling — they must be created directly in `storage`.

