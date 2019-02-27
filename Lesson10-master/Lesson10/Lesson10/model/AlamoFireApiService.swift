//
//  AlamoFireApiService.swift
//  Lesson10
//
//  Created by Thomas Vandegriff on 2/26/19.
//  Copyright © 2019 Make School. All rights reserved.
//

    /*** AlamoFireApiService.swift is an API Service client designed to fetch, post and process data to and from the JSONPlaceholder web service:
 
        - Using Alamofire
            https://github.com/Alamofire/Alamofire
    ***/

import Foundation
import Alamofire


class AlamoFireApiService {
    
    
    // TODO: Create a function that implements a POST request Using Alamofire
        
        
    func getRequest() {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result

            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }

            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
    
    func postRequest() {
        let parameters = ["title": "Super Cool Post", "completed": 0, "userId": 8] as [String : Any]
        let endPoint = "https://jsonplaceholder.typicode.com/todos"
        
        Alamofire.request(endPoint, method: .post, parameters: parameters).responseJSON { response in
            print(response)
        }
    }
}
