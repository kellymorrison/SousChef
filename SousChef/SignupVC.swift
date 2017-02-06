//
//  ViewController.swift
//  SousChef
//
//  Created by Kelly Morrison on 2017-01-31.
//  Copyright © 2017 Kelly Morrison. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FirebaseAuth

class SignupVC: UIViewController,FBSDKLoginButtonDelegate {

    var facebookSignupButton: FBSDKLoginButton = FBSDKLoginButton()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            // move the user to the home screen
            print("USER LOGGED INNNNN")
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeVC")
            
            self.present(homeVC, animated: true, completion: nil)
            
        } else {
            
            facebookSignupButton.center = self.view.center
            self.facebookSignupButton.readPermissions = ["public_profile", "email", "user_friends"]
            self.facebookSignupButton.delegate = self
            
            self.view!.addSubview(facebookSignupButton)
        }

        
        
        
//        let reference = FIRDatabase.database().reference()
//        reference.child("NewChild").setValue("new child value")
//        reference.child("newArry").setValue(["this","is","an","array"])
//        // LMK when a new child is added / what is in the database
//        reference.observe(.childAdded, with: { (snapshot) in
//            print("THIS IS WHAT IS IN THE DATABASE \(snapshot)")
//        
//        })
//        //adds a new child and automatically generates key
//        reference.child("giveMeKeys").childByAutoId().setValue("Test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("user logged in")
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)

        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
             print("user logged in with Firebase")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("user logged out")
    }
}

