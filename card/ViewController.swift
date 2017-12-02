//
//  ViewController.swift
//  card
//
//  Created by Greg  MacEachern on 2017-12-02.
//  Copyright © 2017 Greg MacEachern. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tb3: UITextField!
    @IBOutlet weak var tb2: UITextField!
    @IBOutlet weak var tb1: UITextField!
    @IBOutlet weak var BTN: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewMyCard: UIView!
    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet var tapped: UITapGestureRecognizer!
    @IBOutlet weak var IMGDefault: UIImageView!
    
    
    var ref: DatabaseReference!
    let loggedUser = Auth.auth().currentUser
    var created = false
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCreate.layer.cornerRadius = btnCreate.frame.width/2
        
        
        
         ref = Database.database().reference()
        
        ref.child("users").child(self.loggedUser!.uid).child("YourCard").observe(.value){
            (snap: DataSnapshot) in
            
            if snap.exists() != true{
                self.viewMyCard.isHidden = false
                self.btnCreate.isHidden = true
            }
        }
        ref.child("users").child(self.loggedUser!.uid).child("Name").observe(.value){
            (snap: DataSnapshot) in
            let Name = snap.value as! String
             self.lblName.text = Name
            self.lblWelcome.text = "Welcome \(Name)"
       
        
        }
       
    }
    @IBAction func Tapped(_ sender: UITapGestureRecognizer) {
        
        //this method opens a little menu at the bottom with the options; View Picture, Photos and Camera
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        let myActionSheet = UIAlertController(title: "Profile Picture", message: "Select", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let viewPicture = UIAlertAction(title: "View Picture", style: UIAlertActionStyle.default) { (action) in
            //Put code for what happens when the button is clicked
            let imageView = sender.view as! UIImageView
            let newImageView = UIImageView(image: imageView.image)
            
            
            newImageView.frame = self.view.frame
            
            newImageView.backgroundColor = UIColor.black
            newImageView.contentMode = .scaleAspectFit
            
            newImageView.isUserInteractionEnabled = true
            
            let tap = UITapGestureRecognizer(target:self,action:#selector(self.dismissFullScreenImage))
            
            newImageView.addGestureRecognizer(tap)
            self.view.addSubview(newImageView)
            
        }
        
        let photoGallery = UIAlertAction(title: "Photos", style: UIAlertActionStyle.default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum)
            {
                
                //Not sure why i have to set the imagepickers delegate to self. Thats the only way it worked tho
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }
        }
        
        let camera = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
            {
                
                //This was a pain in the ass to get to work. In the in GoogleService-Info.plist you HAVE to add the camera permission (for future projects obvi)
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
                self.imagePicker.allowsEditing = true
                self.present(self.imagePicker, animated: true, completion: nil)
                
            }
        }
        
        
        myActionSheet.addAction(viewPicture)
        myActionSheet.addAction(photoGallery)
        myActionSheet.addAction(camera)
        myActionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    // This func just dismisses the view when the user tappen "View Picture"
    @objc func dismissFullScreenImage(_sender:UITapGestureRecognizer){
        _sender.view?.removeFromSuperview()
    }
    

    @IBAction func clicker(_ sender: Any) {
       
        
        if (tb1.text != "" || tb2.text != "" || tb3.text != ""){
            
        }
        ref.child("users").child("user2").setValue("post")
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        //Seeting the image equal to the profile picture. If the image was edited (cropped) it will upload that instead
        var selectedImage:UIImage?
        
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            selectedImage = editedImage
        }
        else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            selectedImage = originalImage
        }
        
        if let selectedImage2 = selectedImage
        {
            IMGDefault.image = selectedImage2

            
            
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //if persons presses cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

