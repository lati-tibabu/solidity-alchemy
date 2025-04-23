---
marp: true
---

# 📘 Solidity: Basic Data Types

Solidity provides several fundamental data types essential for building smart contracts. Below is an organized summary of the basic data types.

---

## 🧠 Storage Variables

- **Definition**: Stored in the blockchain’s permanent data storage. Changes are persistent and globally accessible.
- **Syntax**:
  ```solidity
  contract Contract {
      bool myVariable;
  }
  ```
- **Default Value**: Uninitialized variables take default values. For `bool`, this is `false`.
- **Example with Initialization**:
  ```solidity
  contract Contract {
      bool public myVariable = true;
  }
  ```
  - Adding `public` automatically creates a **getter function** named `myVariable()`.

---

## 🔢 Unsigned Integers (`uint`)

- **Definition**: Non-negative whole numbers (no negative values).
- **Bit-Width Variants**: `uint8`, `uint16`, ..., `uint256` (default is `uint256`).
- **Example**:
  ```solidity
  uint8 x = 255;
  ```
- **Range of `uint8`**: `0` to `255`
- **Calculation**: Max value = `(2^n) - 1` where `n` is the number of bits.
- **Overflow Example**: Adding two `uint8` values that exceed `255` results in an overflow (prior to Solidity 0.8).

---

## ➖ Signed Integers (`int`)

- **Definition**: Whole numbers, both positive and negative.
- **Bit-Width Variants**: `int8`, `int16`, ..., `int256` (default is `int256`).
- **Comparison**:
  - `uint8`: `0` to `255`
  - `int8`: `-128` to `127`
- **Total Values**: Still 256 values for both due to 8-bit representation.

---

## ✏️ String Literals

- **Definition**: Human-readable sequences of characters in double quotes.
- **Example**:
  ```solidity
  string msg2 = "Hello World";
  bytes msg1 = "Hello World";
  ```
- **Types**:

  - `string`: Dynamic size, human-readable.
  - `bytes`: Byte array representation.
  - `bytes32`: Fixed-size byte array, better for short static strings.

- **Storage Optimization**:
  - Use `bytes32` for short strings.
  - Store long strings off-chain (e.g., IPFS) and save a hash on-chain.
- **UTF-8 Encoding Impact**:
  - `c` = 1 byte (`0x63`)
  - `ć` = multiple bytes (`0xc487`)
- **Compile-Time Limitation**:
  ```solidity
  bytes32 msg1 = "cccccccccccccccccccccccccccccccc"; // Valid
  bytes32 msg2 = "ćććććććććććććććć"; // Valid
  ```

---

## 🧭 Enum Type

- **Definition**: A way to define a set of named constants (enumerations).
- **Problem Without Enum**:
  ```solidity
  if(player.movement == 0) {
      // player is moving up
  }
  ```
  - Prone to error if values change elsewhere in the code.
- **Enum Usage**:

  ```solidity
  enum Directions { Up, Left, Down, Right }

  if(player.movement == Directions.Up) {
      // Safe and readable
  }
  ```

- **Benefits**:
  - Improved readability.
  - Centralized control of value definitions.
  - More robust and less error-prone code.
