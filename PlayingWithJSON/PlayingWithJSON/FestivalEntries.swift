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

struct City: Codable {
    let name: String
    let id: String
}

enum FestivalType: String, Codable {
    case music
    case food
    case cinema
}

struct Festivall: Codable {
    let date: Date
    let name: String
    let city: City
    let lineup: [Participant]
    let type: FestivalType
}



