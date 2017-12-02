//
//  ProfileView.swift
//  hackatathon1
//
//  Created by edward munn on 2017-12-02.
//  Copyright © 2017 edward munn. All rights reserved.
//

import UIKit

class ProfileView: UIViewController {

    @IBOutlet weak var FacebookLabel: UILabel!
    
    @IBOutlet weak var TwitterLabel: UILabel!
    @IBOutlet weak var SnapchatLabel: UILabel!
    @IBOutlet weak var InstagramLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    @IBOutlet weak var PhoneNumberLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Greg Code for Database
        //Set variables equal to database code
        let Facebook = "Facebook"
        let Twitter = "Twitter"
        let Snapchat = "Snapchat"
        let Email = "Email"
        let Instagram = "Instagram"
        let PhoneNumber = "Phone Number"
        
        FacebookLabel.text = "\(Facebook)"
        TwitterLabel.text = (Twitter)
        SnapchatLabel.text = (Snapchat)
        EmailLabel.text = "\(Email)"
        InstagramLabel.text = (Instagram)
        PhoneNumberLabel.text = (PhoneNumber)
        
        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
