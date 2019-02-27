# Mobile Class 1.3

## Class
**[class-ClosureChallenges](https://github.com/RinniSwift/MOB1.3/blob/master/class-ClosureChallenges.playground/Contents.swift)**
*Class work on functions and closures (Jan.22)*
1. creating a closure
2. creating a function that passes into the sort method
3. creating an escaping and non escaping closure
4. ways to create escaping closures: asynchronous block and storing in a property

**[pom-starter-master](https://github.com/RinniSwift/MOB1.3/tree/master/pom-starter-master)**
*Communication patterns (Jan.31)*
1. implementing target-action pattern for event handling
2. notifications with Notification Center

**[leakyStarship-master](https://github.com/RinniSwift/MOB1.3/tree/master/LeakyStarship-master)**
*Memory management and ARC (Feb.5)*
1. using weak and unowned self for closures and variables
2. how to debug memory leaks in Xcode

**[playingWithJSON](https://github.com/RinniSwift/MOB1.3/tree/master/PlayingWithJSON/PlayingWithJSON)**
*Working with JSON data (Feb.7)*
1. read JSON data from a file
2. serializing a programs internal data structure into some kind of interchange formate using decode and encode
3. creating types conformin to the Codeable protocol (this allows us to create an encoder and decoder)
4. using convenient init to set the cells data.

**[product hunt](https://github.com/RinniSwift/Product-Hunt)**
*API requests (Feb.11)*
1. creating a token to use the Product Hunt API
2. setting up the network manager
3. creating coding keys to match names of the JSON data
4. using decode to read data that match the coding keys.
5. setting UIImageView from data of a url using URLSession.shared.dataTask(with: )

**[dailyPlanet-master](https://github.com/RinniSwift/MOB1.3/tree/master/DailyPlanet-master)**
*API requests (Feb.12)*
1. creating a default urlSessionConfiguration. (behaves like a shared session but allows more configuration and allows to obtain data incrementally with a delegate)
2. URLRequest to the url online.
3. creating a dataTask to send and recieve data using NSObjects (short and interactive requests)
4. deserializing binary data to json data. 
5. pagination for fetching data with links.

**[lesson10](https://github.com/RinniSwift/MOB1.3/tree/master/Lesson10-master)**
*Networking requests mainly post and get (Feb.26)*
1. creating a get and post for the url portion
2. using the Alamofire networking library to use get and post

## [delegates-starter-master](https://github.com/RinniSwift/MOB1.3/tree/master/delegates-starter-master)
*The above file demonstrates:*
1. passing information from source view controller to destination view controller using a completion handler

## [tutorial_closures-master](https://github.com/RinniSwift/MOB1.3/tree/master/tutorial_closures-master)
*The above file demonstrates:*
1. passing information from source view controller to destination view controller using a delegate

## [protocolsAndDelegates.playground](https://github.com/RinniSwift/MOB1.3/blob/master/ProtocolsAndDelegates.playground/Contents.swift)
*The above file demonstrates:*
1. difference between delegates, delegators, and protocols
2. how to label delegates, delegators, and protocols in your projects
3. instructions on how to create/use a delegate in your project
