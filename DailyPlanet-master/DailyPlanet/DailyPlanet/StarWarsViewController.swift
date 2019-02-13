//
//  StarWarsViewController.swift
//  DailyPlanet
//
//  Created by Rinni Swift on 2/12/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    var peopleList = [Any]()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            guard let mime = response?.mimeType, mime == "application/json" else {
                print("wrong mime type!")
                return
            }
            
            
            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let results = jsonObject["results"] as? [[String: Any]] {
                        for resultt in results {
                            self.peopleList.append(resultt)
                            print(resultt["name"])
                        }
                    }
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
        return 5
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell") as! StarWarsPeopleTableViewCell
        return cell
    }
    
    
}

