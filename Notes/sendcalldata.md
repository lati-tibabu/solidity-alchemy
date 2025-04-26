# Calldata (How to Target Functions!)

- Solidity's job is to **compile contracts to bytecode**.
- Solidity **does not know** about the blockchain it's deployed on.
- If you tell Solidity to call an address with **specific calldata**, it will simply do it — no questions asked!
- You can send calldata using **high-level** or **low-level** syntax.

---

## High-Level Syntax

First, let's look at the high-level way to make function calls:

```solidity
contract A {
  uint sum;
  function storeSum(address b) external {
    sum = B(b).add(5, 10);
  }
}

contract B {
  function add(uint x, uint y) external returns (uint) {
    return x + y;
  }
}
```

---

## Same Idea, Different Argument

You can pass the contract directly or just an address — Solidity handles both:

```solidity
function storeSum(B b) external {
  sum = b.add(5, 10);
}
```

Or:

```solidity
function storeSum(address b) external {
  sum = B(b).add(5, 10);
}
```

Either way, the argument is **an address** under the hood!

---

## Using Interfaces

You can also use an interface to define the contract's external methods:

```solidity
contract A {
  uint sum;
  function storeSum(B b) external {
    sum = b.add(5, 10);
  }
}

interface B {
  function add(uint x, uint y) external returns (uint);
}
```

👆 Here, you're **telling the compiler** what the calldata should look like!

---

## Low-Level Syntax

Now, how about the low-level way?

```solidity
contract A {
  uint sum;
  function storeSum(address b) external {
    (bool success, bytes memory returnData) =
      b.call(abi.encodeWithSignature("add(uint256,uint256)", 5, 10));
    require(success);
    sum = abi.decode(returnData, (uint));
  }
}

contract B {
  function add(uint x, uint y) external pure returns (uint) {
    return x + y;
  }
}
```

---

## How `encodeWithSignature` Works

`abi.encodeWithSignature("add(uint256,uint256)", 5, 10)` is doing three things:

- Takes the **first 4 bytes** of `keccak256("add(uint256,uint256)")`, which is `0x771602f7`
- Encodes the first argument `5` as a `uint256`
- Encodes the second argument `10` as a `uint256`

Thus, the final calldata looks like:

```
0x771602f7
0000000000000000000000000000000000000000000000000000000000000005
000000000000000000000000000000000000000000000000000000000000000a
```

All concatenated together!

---

## Sending Calldata

Regardless of using high-level or low-level syntax, **Solidity compiles your code to send specific calldata** to an address.

> 👩‍💻 It's _your responsibility_ as the developer to ensure the target contract knows how to handle that calldata correctly!
