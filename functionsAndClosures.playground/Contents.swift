/*
 22.01.2019
 */


/*
    transfer functions into closures
 */

func add(x: Int, y: Int) -> Int {
    return x + y
}

let add: (Int, Int) -> Int = { (x, y) in
    return x + y
}



/*
    passing functions as parameters
 */
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

func back(_ numOne: Int, _ numTwo: Int) -> Bool {
    return numOne > numTwo
}

let names = ["asf", "bpo", "some", "some"]
var reversedNames = names.sorted(by: backward)

let numbers = [2, 5, 1, 0, 9]
var sortedNum = numbers.sorted(by: back)

/*
 
 closures only capture elements inside the closure.
 
 non-escaping closures
    they are non-escaping by default
    must be executed when called
    lifestyle has 4 cycles
 
 escaping closures
    it will be stored somehow
    more prone to retain cycles
    they are escaping when you store it in a property or an asynchronous block
 
 */
