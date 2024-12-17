import SomeContract from 0x06

access(all) fun main() {
    //
    /* AREA 4 ***/
    /**/

    // Accessing public variables and calling public functions:
    let someContractInstance = SomeContract.testStruct

    // Reading public variables
    let readA = someContractInstance.a
    let readB = someContractInstance.b

    // Setting public variables
    someContractInstance.setA(newValue: "Script modified a")
    someContractInstance.setB(newValue: "Script modified b")

    // Calling public function
    someContractInstance.publicFunc()

    // Note:
    // - We cannot directly modify or read 'c' because it's contract-accessible.
    // - We cannot access 'd' or call 'privateFunc' since they are self-accessible within SomeStruct.
    // - We cannot call 'contractFunc' because it's only accessible within the contract itself.
}
