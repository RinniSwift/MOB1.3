//
//  ViewController.swift
//  CommunicationClass
//
//  Created by Adriana González Martínez on 1/31/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var loginButton: LoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        loginButton.dict = ["Rinni": 19]

    }
    
    @objc func loginButtonPressed(sender: LoginButton){
        print(sender.dict)
    }
}

