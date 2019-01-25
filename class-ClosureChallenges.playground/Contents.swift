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
func return42(closure: () -> ()) {
    closure()
}
return42(closure: {
    return 42
})


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







func flyAway(finalStage: String) {
    print("\(finalStage) emerged, flying away... ")
}

// this is a non-escaping closure.

// non escaping, escaping(asynchronous block and storing in a property)

// to use an escaping closure, you create a variable with the completion type and equal it to { _ in return }
// set the completion to @escaping to tell us that we want to use an escaping function
// and set the variable we created to the completion


func metamorphosis(initialStage:String, completion: @escaping (String) -> Void) {
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...21 {
        print("\(initialStage) inside cocoon")
    }
    
    DispatchQueue.main.async {
        completion("🦋")
    }
}



metamorphosis(initialStage:"🐛", completion: flyAway)

// OR

metamorphosis(initialStage: "🐛") { (finalStage) in
    print("\(finalStage) emerged, flying away... ")
}

