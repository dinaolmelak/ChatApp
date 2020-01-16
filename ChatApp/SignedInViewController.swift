//
//  SignedInViewController.swift
//  ChatApp
//
//  Created by Center for Innovation on 11/11/19.
//  Copyright © 2019 Center for Innovation. All rights reserved.
//

import UIKit
import Parse

class SignedInViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var chatTableView: UITableView!
    var posts = [PFObject]()
    override func viewDidLoad() {
        super.viewDidLoad()

        chatTableView.delegate = self
        chatTableView.dataSource = self
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        chatTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let post = posts[indexPath.row]
        let postText = post["text"] as! String
        cell.chatLabel.text = postText
        
        return cell
    }
    
    @objc func onTimer(){
        let query = PFQuery(className: "Posts")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { (pfObjects, error) in
            if error != nil{
                print(error!)
            }else{
                let posts = pfObjects!
                self.posts = posts
                self.chatTableView.reloadData()
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
