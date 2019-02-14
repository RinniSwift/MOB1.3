//
//  FestivalDataCollectionViewCell.swift
//  PlayingWithJSON
//
//  Created by Rinni Swift on 2/8/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class FestivalDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var festivalNameLabel: UILabel!
    @IBOutlet weak var festivalDate: UILabel!
    @IBOutlet weak var festivalNumberPeople: UILabel!
    
    var festival: Festivall? {
        didSet {
            guard let festival = festival else { return }
            self.festivalNameLabel.text = festival.name
            self.festivalDate.text = festival.date
            self.festivalNumberPeople.text = String(festival.lineup.count)
        }
    }
}
