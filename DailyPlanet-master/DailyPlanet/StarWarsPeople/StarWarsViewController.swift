//
//  StarWarsViewController.swift
//  DailyPlanet
//
//  Created by Rinni Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var peopleList = [People]()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchStarWarsAPI()
        print(peopleList)
    }
    
    func fetchStarWarsAPI() {
        let url = URL(string: "https://swapi.co/api/people")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("response is: \(response!)")
                return
            }            
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let results = jsonObject["results"] as? [[String: Any]] {
                        for entry in results {
                            let person = People(dict: entry)
                            self.peopleList.append(person!)
                        }
                    }
                }
                print(self.peopleList)
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

