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
    
    }
    @IBAction func btnAction(_ button
        : TransitionButton) {
        
        print("params\( self.psswrd.text ??  "nothing")")
      
        
        
        let queryItems = [
            "email": self.email_l.text,
            "password": self.psswrd.text
        ]
        
        button.cornerRadius = 5
        
      button.startAnimation() // 2: Then start the animation when the user tap the button
                let qualityOfServiceClass = DispatchQoS.QoSClass.background
                let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
                backgroundQueue.async(execute: {

                     // 3: Do your networking task or background work here.

                 
                    DataService.shared.Login(parameters: queryItems as! [String : String]) { (result) in
                        
                                          DispatchQueue.main.async(execute: { () -> Void in
                                        
                                              switch result{
                                                  case .failure(let error):
                                                      button.stopAnimation()
                                                   print("Error\(error)")
                                                  case .success( let successfful):
                                                      print("Created Succefully\(successfful)")
                                                       button.stopAnimation()
                                                  }
                                            
                        
                                          })
                        
                    }
  
                    
                })

    }
    
    
}
