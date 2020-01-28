//
//  SignUpViewController.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import UIKit
import TransitionButton

class SignUpViewController: UIViewController {

    @IBOutlet weak var departmnt: UITextField!
    
    @IBOutlet weak var f_name: UITextField!
    @IBOutlet weak var l_name: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var passwrdd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sign_up(_ button: TransitionButton) {
      
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {


            
            let queryItems = [
                       "department_id": self.departmnt.text,
                       "first_name": self.f_name.text,
                       "last_name": self.l_name.text,
                       "age": self.age.text,
                       "email": self.email.text,
                       "phone": self.phone.text,
                       "password": self.passwrdd.text,
                   ]
            
           DataService.shared.CreateUserAccount(parameters: queryItems as! [String : String]) { (result) in
 
            DispatchQueue.main.async(execute: { () -> Void in
          
                switch result{
                    case .failure(let error):
                        button.stopAnimation()
                     print("Created Succefully\(error)")
                    case .success( let successfful):
                        print("Created Succefully\(successfful)")
                         button.stopAnimation()
                    }
              
//                button.stopAnimation(animationStyle: .expand, completion: {
//                    let secondVC = MainViewController()
//                    self.present(secondVC, animated: true, completion: nil)
//                })
            })
        }
        })

        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
