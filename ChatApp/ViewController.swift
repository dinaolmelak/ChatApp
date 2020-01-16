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
            configuration.server = "http://chatappname.herokuapp.com/parse"
        }))
    }
    @IBAction func didTapLogIn(_ sender: Any) {
        print("Log in")
        
    }
    @IBAction func didTapSignUp(_ sender: Any) {
        
        print("Sign UP")
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

