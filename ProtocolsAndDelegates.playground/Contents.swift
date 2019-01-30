import UIKit

protocol FeedDelegate {
    func refillWaterBowl()
}

struct Owner: FeedDelegate {
    func refillWaterBowl() {
        print("water bowl filled")
    }
}

struct Pet {
    var delegate: FeedDelegate?
}

let sarin = Owner()
sarin.refillWaterBowl()

var flopsy = Pet()
flopsy.delegate = sarin
flopsy.delegate?.refillWaterBowl()



/*
 
 protocol: defines the responsibilitys that will be delegated       (FeedDelegate)
 delegator: an instance of something conforming to that protocol    (Pet)
 delegate: adopts the protocol and implements its requirements      (Owner)
 
 The delegator has a delegate which conforms to a protocol
 
 in a table view:
    the delegator is the table view controller
    the delegate is the view controller class
 
 
 ** delegate project **
 
 how to use delegates and protocols:
 1. add a protocol
 2. create the delegate property which you want to pass data from
 3. add the delegate method call and pass the parameters in
 4. let the destination view controller adopt to that protocol
 5. create a reference to the source view controller and specify the delegate
 6. use the method of the protocol(mainly used with the parameter to set the UI)
 
 Delegator: (SecondViewController) Has a delegate property and a delegate method call.
 Delegate: (FirstViewController) Performs the task, adopts to the protocol, and set the self to the delegate
 
 */
