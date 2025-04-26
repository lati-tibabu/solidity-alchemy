# Arrays

- Arrays are our **first reference type**! 🎊
- Arrays behave **differently** in **storage** vs **memory/calldata** 💿
- Arrays aren't used as frequently as **mappings** 😢
  - Best for **ordered data** or when **iteration** is needed 🔢
  - **Unlimited size + iteration** can become a **DOS vector** ⛽️

---

## Reference Types

- **Reference Types** include: `string`, `bytes`, `arrays`, `mappings`, and `structs`
- When used as function arguments, you **must declare the data location**: `calldata`, `memory`, or `storage`
- They are **potentially passed by reference**, unlike value types.

👉 Let's explore how arrays behave across different data locations!

---

## Storage

In storage, arrays can be either **fixed-size** or **dynamic-size**:

```solidity
contract X {
  uint[3] favoriteNumbers; // fixed-size array
  uint[] allNumbers;        // dynamic-size array

  constructor() {
    allNumbers.push(1);      // ✅ push allowed on dynamic arrays
    favoriteNumbers[0] = 1;  // ✅ set values manually on fixed arrays
    // favoriteNumbers.push(1); // ❌ push not allowed
  }
}
```

---

## Storage (Passing by Reference)

You can **pass a storage pointer** to modify an array directly:

```solidity
import "forge-std/console.sol";

contract X {
  uint[3] favoriteNumbers;

  constructor() {
    modifyArray(favoriteNumbers);
    console.log(favoriteNumbers[0]); // 22
  }

  function modifyArray(uint[3] storage nums) private {
    nums[0] = 22;
  }
}
```

✅ Changes inside the function **persist** because it's a storage reference.

---

## Calldata

**Calldata** refers to **input data** — it is **read-only**:

```solidity
import "forge-std/console.sol";

contract X {
  function readArr(uint[3] calldata arr) external view {
    // arr[0] = 5; // ❌ cannot modify calldata
    console.log(arr[0]);
  }
}
```

✅ Calldata is **cheaper** and **immutable** — perfect for read-only arguments!

---

## Memory

**Memory** creates a **temporary, modifiable copy** of the array:

```solidity
import "forge-std/console.sol";

contract X {
  function readArr(uint[3] memory arr) external view {
    arr[0] = 5; // ✅ memory is writable
    console.log(arr[0]); // 5
  }
}
```

✅ Changes to memory copies **do not affect** storage or calldata.
