//
//  StarWarsViewController.swift
//  DailyPlanet
//
//  Created by Rinni Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    // MARK: - Variables
    var peopleList = [People]()
    var pageNumber = 1

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchStarWarsAPI()
    }
    
    func fetchStarWarsAPI() {
        let url = URL(string: "https://swapi.co/api/people/?page=\(pageNumber)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let results = jsonObject["results"] as? [[String: Any]] {
                        for entry in results {
                            let person = People(dict: entry)
                            self.peopleList.append(person!)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
}

extension StarWarsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! StarWarsPeopleTableViewCell
        cell.person = peopleList[indexPath.row]
        print(peopleList[indexPath.row])
        
        return cell
    }
}

extension StarWarsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == peopleList.count - 1 {
            if pageNumber < 9 {
                pageNumber += 1
                DispatchQueue.main.async {
                    self.fetchStarWarsAPI()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

