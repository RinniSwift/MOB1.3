import UIKit

/*
1. Write a closure that prints the string "Learning Swift" and assign the closure to a variable. Then call the closure.
*/
var printThis: () -> () = {
    print("Learning Swift")
}
printThis()

/*
 2. Write a closure that takes two integers and returns the sum of the integers. Assign the closure to a variable and then call the closure. The closure can be written in a few different ways. Experiment and try 2 ways.
 */
var sum: (Int, Int) -> Int = { (x, y) in
    x + y
}
var sumSec: (Int, Int) -> Int = { $0 + $1 }

let add = sum(2, 3)
let addSec = sumSec(4, 5)


/*
 3. Write a closure that returns the value 42, without assigning the closure to a variable. Immediately call the closure and also ignore the return value from the closure.
 */
var return42: () -> Int = {
    return 42
}
return42()


/*
 4. let numbers = [22, 10, 42, 100, 8, 4]
    sort the numbers array
 */
func sort(_ x: Int, _ y: Int) -> Bool {
    return x < y
}
let numbers = [22, 10, 42, 100, 8, 4]
let sorted = numbers.sorted(by: sort)

/*
 5. Write a function that returns a closure. The function should contain the following variable:
    let message = "This is an important message"
    The closure that the function returns should print the value of that variable.
 */
func returnClosure(mes: String) -> () {
    print(mes)
}
let message = "This is an important message"
returnClosure(mes: message)
