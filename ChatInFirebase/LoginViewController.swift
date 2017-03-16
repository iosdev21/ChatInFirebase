//
//  LoginViewController.swift
//  ChatInFirebase
//
//  Created by Admin on 3/15/17.
//  Copyright © 2017 harry. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let navVc = segue.destination as! UINavigationController // 1
        let channelVc = navVc.viewControllers.first as! ChannelListViewController // 2
        
        channelVc.senderDisplayName = nameField?.text // 3
    }
   
    @IBAction func loginDidTouch(_ sender: Any) {
        
        if nameField?.text != "" { // 1
            FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in // 2
                if let err = error { // 3
                    print(err.localizedDescription)
                    return
                }
                
                self.performSegue(withIdentifier: "LoginToChat", sender: nil) // 4
            })
        }    }
}
