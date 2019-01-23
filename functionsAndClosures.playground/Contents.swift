
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
let names = ["hi", "bpo", "some"]
var reversedNames = names.sorted(by: backward)
