//
//  HomeViewController.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 2/13/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sigh out", style: .plain, target: self, action: #selector(hangout))
    }
    

    @objc func hangout() {

        UserDefaults.standard.setLoggedIn(value: true)
        
        let loginController = LoginViewController()
        present(loginController, animated: true, completion: nil)
        
    }
  

}
