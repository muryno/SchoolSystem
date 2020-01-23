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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
 
    @IBAction func btnAction(_ button
        : TransitionButton) {
        
        button.cornerRadius = 20
        
        button.startAnimation() // 2: Then start the animation when the user tap the button
        let qualityOfServiceClass = DispatchQoS.QoSClass.background
        let backgroundQueue = DispatchQueue.global(qos: qualityOfServiceClass)
        backgroundQueue.async(execute: {

            sleep(3) // 3: Do your networking task or background work here.

            DispatchQueue.main.async(execute: { () -> Void in
                // 4: Stop the animation, here you have three options for the `animationStyle` property:
                // .expand: useful when the task has been compeletd successfully and you want to expand the button and transit to another view controller in the completion callback
                // .shake: when you want to reflect to the user that the task did not complete successfly
                // .normal
                button.stopAnimation(animationStyle: .expand, completion: {
                    let secondVC = MainViewController()
                    self.present(secondVC, animated: true, completion: nil)
                })
            })
        })

    }
    
    
}
