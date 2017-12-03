//
//  ViewController.swift
//  hackatathon1
//
//  Created by edward munn on 2017-12-02.
//  Copyright © 2017 edward munn. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var lblFacebook: UILabel!
    
    @IBOutlet weak var lblSnap: UILabel!
    @IBOutlet weak var lblInsta: UILabel!
    @IBOutlet weak var lblTwitter: UILabel!

    @IBOutlet weak var labelEmail: UILabel!
    //    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Snapchat").observe(.value){
            (snap: DataSnapshot) in
            self.lblSnap.text = snap.value as? String
            
        }
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Facebook").observe(.value){
            (snap: DataSnapshot) in
            
            self.lblFacebook.text = snap.value as? String
        }
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Instagram").observe(.value){
            (snap: DataSnapshot) in
            
            self.lblInsta.text = snap.value as? String
        }
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Twitter").observe(.value){
            (snap: DataSnapshot) in
            
            self.lblTwitter.text = snap.value as? String
        }
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Phone").observe(.value){
            (snap: DataSnapshot) in
            
            self.lblPhone.text = snap.value as? String
        }
        Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).child("Personal Info").child("Email").observe(.value){
            (snap: DataSnapshot) in
            self.labelEmail.text = snap.value as? String
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        try! Auth.auth().signOut()
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "Login")
        
        self.present(vc, animated: true, completion: nil)
    }
    
}


