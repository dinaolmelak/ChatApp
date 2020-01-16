//
//  ViewController.swift
//  ChatApp
//
//  Created by Center for Innovation on 11/11/19.
//  Copyright © 2019 Center for Innovation. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Parse.initialize(with: ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) in
            configuration.applicationId = "myAppId"
            configuration.server = "https://chatappname.herokuapp.com/parse"
        }))
    }
    @IBAction func didTapLogIn(_ sender: Any) {
        
        if usernameLabel.text == nil || passwordLabel.text == nil || usernameLabel.text == "" || passwordLabel.text == "" {
            print("Something empty")
        }else{
            PFUser.logInWithUsername(inBackground: usernameLabel.text!, password: passwordLabel.text!) { (pfUser, error) in
                if error != nil{
                    print("something went wrong when signing in")
                } else{
                    print("Success!")
                    print("Log in")
                    self.performSegue(withIdentifier: "UserSegue", sender: self)
                }
            }
        }
    }
    @IBAction func didTapSignUp(_ sender: Any) {
        
        if usernameLabel.text == nil || passwordLabel.text == nil || usernameLabel.text == "" || passwordLabel.text == "" {
            print("Something empty")
        } else{
            let user = PFUser()
            user.username = usernameLabel.text!
            user.password = passwordLabel.text!
            user.signUpInBackground { (success, error) in
                if error != nil{
                    print("failed sign up")
                } else{
                    print("Signed Up")
                    self.performSegue(withIdentifier: "UserSegue", sender: self)
                }
            }
        }
    }
    @IBAction func didDragCart(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let kartView = sender.view!
        kartView.center = location
        
        
    }
    @IBAction func didTap(_ sender: Any) {
        print("didTap")
        view.endEditing(true)
        
    }
    @IBAction func didPinchKart(_ sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        print(scale)
        let kartView = sender.view
        kartView?.transform = CGAffineTransform(scaleX: scale, y: scale)
        
        
    }
    

}

