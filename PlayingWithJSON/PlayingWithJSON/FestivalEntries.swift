//
//  FestivalEntries.swift
//  PlayingWithJSON
//
//  Created by Rinni Swift on 2/7/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import Foundation


struct Participant: Codable {
    let name: String
    let id: String
}

// NOT NECESSARY
//struct City: Codable {
//    let name: String
//    let id: String
//}
//
//enum FestivalType: String, Codable {
//    case music
//    case food
//    case cinema
//}

struct Festivall: Codable {
    let date: String
    let name: String
    let lineup: [Participant]
//    let type: FestivalType
//    let city: City

}



