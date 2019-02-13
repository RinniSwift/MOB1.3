//
//  StarWarsPeopleTableViewCell.swift
//  DailyPlanet
//
//  Created by Rinni Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class StarWarsPeopleTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var person: People? {
        didSet {
            guard let person = person else { return }
            nameLabel.text = person.name
            heightLabel.text = "Height: \(person.height)"
            genderLabel.text = "Gender: \(person.gender)"
        }
    }
    
}
