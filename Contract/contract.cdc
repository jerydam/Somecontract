access(all) contract SomeContract {
    // Public variable of the contract, accessible from anywhere
    access(all) var testStruct: SomeStruct

    access(all) struct SomeStruct {

        //
        // Variables
        //

        // 'a' can be read publicly but only set within this struct or contract
        access(all) var a: String

        // 'b' can be both read and set publicly
        access(all) var b: String

        // 'c' can be accessed or modified only within this contract
        access(contract) var c: String

        // 'd' is only accessible within this struct
        access(self) var d: String

        //
        // Functions
        //

        // Public function, can be called from anywhere
        access(all) fun publicFunc() {}

        // Contract function, can only be called within this contract
        access(contract) fun contractFunc() {}

        // Private function, only callable within this struct
        access(self) fun privateFunc() {}

        // Setter function for 'a'
        access(all) fun setA(newValue: String) {
            self.a = newValue
        }

        // Setter function for 'b'
        access(all) fun setB(newValue: String) {
            self.b = newValue
        }

        // Setter function for 'c'
        access(contract) fun setC(newValue: String) {
            self.c = newValue
        }

        access(all) fun structFunc() {
            /**************/
            /*** AREA 1 ***/
            /**************/
            
            // Here all variables can be read:
            // - a, b, c, d are readable
            // - a, b, c can be modified (d is self-accessible only here)
            self.setA(newValue: "new a")
            self.setB(newValue: "new b")
            self.setC(newValue: "new c")
            self.d = "new d"

            // All functions can be called:
            self.publicFunc()
            self.contractFunc()
            self.privateFunc()
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }
    }

    access(all) resource SomeResource {
        access(all) var e: Int

        access(all) fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/

            // Here, none of SomeStruct's variables can be accessed directly.
            // You would need an instance of SomeStruct passed to this function to work with its variables.
            // Example:
            // let someStruct = SomeContract.testStruct
            // someStruct.publicFunc() // This would work if you had access to testStruct.

            // Only operations on 'e' can be performed here:
            self.e = self.e + 1
        }

        init() {
            self.e = 17
        }
    }

    access(all) fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    access(all) fun questsAreFun() {
        /**************/
        /*** AREA 3 ****/
        /**************/

        // Here, we can access:
        // - Read: a, b, c from SomeStruct (via testStruct)
        // - Modify: a, b through public access, c through contract access
        // - Cannot access d directly since it's self-accessible in SomeStruct

        // Reading and setting:
        let currentA = self.testStruct.a
        self.testStruct.setA(newValue: "new value for a")
        let currentB = self.testStruct.b
        self.testStruct.setB(newValue: "new value for b")
        let currentC = self.testStruct.c
        self.testStruct.setC(newValue: "new value for c")

        // Calling functions:
        self.testStruct.publicFunc()
        self.testStruct.contractFunc()
        // self.testStruct.privateFunc() // This would fail as privateFunc is only self-accessible
    }

    init() {
        self.testStruct = SomeStruct()
    }
}