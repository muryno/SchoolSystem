//
//  ViewController.swift
//  SchoolSystem
//
//  Created by Muraino Yakubu on 1/23/20.
//  Copyright © 2020 Muraino Yakubu. All rights reserved.
//

import UIKit
import TransitionButton

class LoginViewController: UIViewController {
    let button = TransitionButton(frame: CGRect(x: 20, y: 524, width: 362, height: 30)) // please use Autolayout in real project

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
              self.view.addSubview(button)
               button.backgroundColor = .purple
               button.setTitle("Login", for: .normal)
               button.cornerRadius = 5
               button.spinnerColor = .white
               button.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
           
    }


    @IBAction func login(_ button: TransitionButton) {
             button.startAnimation()
        // 2: Then start the animation when the user tap the button
             let qualityOfServiceClass = DispatchQoS.QoSClass.background
             let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
             backgroundQueue.async(execute: {
             
                 sleep(3) // 3: Do your networking task or background work here.
                 
                 DispatchQueue.main.async(execute: { () -> Void in
                     // 4: Stop the animation, here you have three options for the `animationStyle` property:
                     // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                     // .shake: when you want to reflect to the user that the task did not complete successfly
                     // .normal
                    self.button.stopAnimation(animationStyle: .expand, completion: {
                         let secondVC = UIViewController()
                         self.present(secondVC, animated: true, completion: nil)
                     })
                 })
             })
    }
}

