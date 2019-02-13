//
//  People.swift
//  DailyPlanet
//
//  Created by Rinni Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import Foundation

struct People {
    var name: String
    var height: String
    var gender: String
    
    init?(dict: [String: Any]) {
        self.name = dict["name"] as? String ?? ""
        self.height = dict["height"] as? String ?? ""
        self.gender = dict["gender"] as? String ?? ""
    }
}
