# Flow Smart Contract: SomeContract

This repository contains a Flow smart contract named `SomeContract`, which includes a struct `SomeStruct` and a resource `SomeResource`. It demonstrates various access control patterns such as `access(all)`, `access(contract)`, and `access(self)`.

## Table of Contents

- [Description](#description)
- [Contract Structure](#contract-structure)
- [Variables and Functions](#variables-and-functions)
- [Usage](#usage)
- [Notes](#notes)

## Description

`SomeContract` is a Flow smart contract that showcases different access control levels. It includes:

- A struct `SomeStruct` with public (`access(all)`), contract-only (`access(contract)`), and self-only (`access(self)`) accessible variables.
- A resource `SomeResource` that allows for read and modify operations.
- Functions that demonstrate how to access and modify variables within the contract and its struct.

## Contract Structure

### Struct: `SomeStruct`
- **Variables**:
  - `a`: Publicly readable but can only be set within the struct or contract.
  - `b`: Readable and writable publicly.
  - `c`: Accessible only within the contract.
  - `d`: Only accessible within the struct.

- **Functions**:
  - `publicFunc()`: Public function that can be called from anywhere.
  - `contractFunc()`: Function accessible only within the contract.
  - `privateFunc()`: Function only callable within the struct.
  - `setA(newValue: String)`: Setter function for variable `a`.
  - `setB(newValue: String)`: Setter function for variable `b`.
  - `setC(newValue: String)`: Setter function for variable `c`.
  - `structFunc()`: Function within `SomeStruct` demonstrating the accessibility of variables and functions.

### Resource: `SomeResource`
- **Variables**:
  - `e`: An integer that can be read and modified.
- **Functions**:
  - `resourceFunc()`: Function within the resource that can modify `e`.

### Main Contract Function: `createSomeResource()`
- Creates an instance of `SomeResource` that can be used in other parts of the contract.

### Other Function: `questsAreFun()`
- Demonstrates access to variables within `SomeStruct` from the main contract scope.

## Usage

To use this contract:

1. Deploy `SomeContract` to a Flow blockchain.
2. Access the contract through its address.
3. Use `createSomeResource()` to instantiate `SomeResource` as needed.
4. Call `questsAreFun()` to demonstrate accessing variables and functions within `SomeStruct`.

```plaintext
import SomeContract from 0x06

access(all) fun main() {
    let someContractInstance = SomeContract.testStruct

    let readA = someContractInstance.a
    let readB = someContractInstance.b

    someContractInstance.setA(newValue: "Script modified a")
    someContractInstance.setB(newValue: "Script modified b")

    someContractInstance.publicFunc()
}
```

## Notes

- Ensure the contract is deployed correctly on the Flow blockchain at address `0x06`.
- Access control (`access(all)`, `access(contract)`, `access(self)`) is critical to understanding how to interact with variables and functions.
- Private functions (`privateFunc()`) can only be called from within the struct (`SomeStruct`).
- Only public (`access(all)`) and contract (`access(contract)`) accessible variables and functions can be interacted with from the main script (`main()`).

