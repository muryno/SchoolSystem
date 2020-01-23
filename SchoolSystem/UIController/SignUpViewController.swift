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
    
    @IBAction func sign_up(_ sender: TransitionButton) {
        let parameter = ["first_name":f_name.text,"email":email.text,
                         "Phone":phone.text,"age":age.text,
                    "Password":passwrdd.text,"last_name":l_name.text,
                      "department_id":departmnt.text
        ]
        
        
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
