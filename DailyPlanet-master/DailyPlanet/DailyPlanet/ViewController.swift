//
//  ViewController.swift
//  DailyPlanet
//
//  Created by Thomas Vandegriff on 2/7/19.
//  Copyright © 2019 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nasaDailyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        fetchHeaderData()
        
        //TODO: Call function to fetch image data here
//        fetchNasaDailyImage()
        fetchStarWarsAPI()
        
    }

    //MARK: Data Fetch functions
    
    func fetchHeaderData() {
        
        let defaultSession = URLSession(configuration: .default)
        
        // Create URL
        let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")
        
        // Create Request
        let request = URLRequest(url: url!)
        
        // Create Data Task
        let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            
            print("data is: ", data!)
            print("response is: ", response!)
            
        })
        dataTask.resume()
    }

     // CODE BASE for In-Class Activity I
    func fetchNasaDailyImage() {
        
        //TODO: Create session configuration here
        let defaultSession = URLSession(configuration: .default)
        let url = URL(string: "https://apod.nasa.gov/apod/image/1902/PlaneTrailMoon_Staiger_1555.jpg")
        let request = URLRequest(url: url!)

        
        //TODO: Create URL (...and send request and process response in closure...)
        if let url = URL(string: "https://apod.nasa.gov/apod/image/1902/PlaneTrailMoon_Staiger_1555.jpg") {
            
           //TODO: Create Request here
            
            // Create Data Task...
            let dataTask = defaultSession.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                
                print("data is: ", data!)
                print("response is: ", response!)
                
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        
                        //TODO: Insert downloaded image into imageView
                        // network requests are asynchronous. we got back data but setting the image needs to happen in this block (in the main thread)
                        self.nasaDailyImageView.image = image
                    }
                }
            })
            dataTask.resume()
        }
    }
    
    func fetchStarWarsAPI() {
        let url = URL(string: "https://swapi.co/api/starships/")!
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
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                print(jsonObject)
            } catch {
                print("json error: \(error.localizedDescription)")
            }
        }
        dataTask.resume()
    }
    
}

