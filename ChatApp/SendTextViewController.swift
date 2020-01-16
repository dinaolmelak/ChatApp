//
//  SendTextViewController.swift
//  ChatApp
//
//  Created by Center for Innovation on 1/16/20.
//  Copyright © 2020 Center for Innovation. All rights reserved.
//

import UIKit
import Parse

class SendTextViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 20
    }
    
    @IBAction func onTapSend(_ sender: Any) {
        let post = PFObject(className: "Posts")
        post["user"] = PFUser.current()!
        post["text"] = textView.text!
        post.saveInBackground { (succes, error) in
            if error != nil{
                print("Messed Up somewhere")
            } else{
                print("Posted!")
            }
        }
        
        
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
