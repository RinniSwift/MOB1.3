//
//  ViewController.swift
//  PlayingWithJSON
//
//  Created by Rinni Swift on 2/7/19.
//  Copyright © 2019 Rinni Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var festivals: [Festivall] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM d, yyyy"
        
        
        let path = Bundle.main.path(forResource: "Festival", ofType: ".json")
        if let path = path {
            let url = URL(fileURLWithPath: path)
            print(url)
            let contents = try? Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
//            decoder.dateDecodingStrategy = .formatted(formatter)
            if let data = contents,
                let festivalsFromJSON = try? decoder.decode([Festivall].self, from: data) {
                festivals = festivalsFromJSON
                for fest in festivals {
                    print(fest.date)
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return festivals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "festivalCell", for: indexPath) as! FestivalDataTableViewCell
        let fest = festivals[indexPath.row]
        cell.festival = fest
        return cell
    }
}

