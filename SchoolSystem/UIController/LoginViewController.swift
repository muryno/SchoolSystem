//
//  LoginViewController.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import UIKit
import TransitionButton

class LoginViewController: UIViewController {
    let buttonn = TransitionButton() // please use Autolayout in real project

    @IBOutlet weak var email_l: UITextField!
    @IBOutlet weak var psswrd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        DataService.shared.GetDepartment {
//            (result) in
//
//                  DispatchQueue.main.async {
//                            switch result{
//                                case .failure(let error):
//                                    print(error)
//
//                                case .success(let gists):
//
//                                      print(gists)
//
//                                  self.gistData = gists
//                                  self.feedTableView.reloadData()
//
//                                    for gist in gists{
//
//
//                                    }
//                                }
//            }
//    }
        if (UserDefaults.standard.isLoggedIn()){
            self.performSegue(withIdentifier: "homeviewsegue", sender: self)

        }
    
    }
    @IBAction func btnAction(_ button
        : TransitionButton) {
        
      self.performSegue(withIdentifier: "homeviewsegue", sender: self)

         UserDefaults.standard.setLoggedIn(value: true)

//
//
//        let queryItems = [
//            "email": self.email_l.text ??  "",
//            "password": self.psswrd.text ??  ""
//        ]
//
//        button.cornerRadius = 5
//
//      button.startAnimation() // 2: Then start the animation when the user tap the button
//                let qualityOfServiceClass = DispatchQoS.QoSClass.background
//                let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
//                backgroundQueue.async(execute: {
//
//                     // 3: Do your networking task or background work here.
//
//                    let url = "http://192.168.1.23:5000/api/student/login"
//
//                           let req:Request = Request()
//                    req.getResponse(url: url, parameters: queryItems as [String : Any], httpMethod: .post) {(result: Results<UserBase>) in
//
//                        DispatchQueue.main.async(execute: { () -> Void in
//
//                            switch result{
//                                case .failure(let error):
//                                    button.stopAnimation()
//                                 print("Error\(error)")
//                                case .success( let successfful):
//                                    print("Created Succefully\(successfful)")
//
//
//                                    UserDefaults.standard.setLoggedIn(value: true)
//
//                                    button.stopAnimation()
//                                }
//
//
//                        })
//                    }
//
//
//
//                })
//
//
        
    }
    
    

    
    
    
    
}
