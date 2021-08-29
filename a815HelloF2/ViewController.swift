//
//  ViewController.swift
//  a815HelloF2
//
//  Created by 申潤五 on 2021/8/22.
//



import FBSDKLoginKit
import Firebase
import UIKit

class ViewController: UIViewController, LoginButtonDelegate {
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        let token = AccessToken.current
        
        let credential = FacebookAuthProvider
          .credential(withAccessToken: token!.tokenString)
        
        Auth.auth().signIn(with: credential) { result, error in
            print("try signIn Firebase")
            
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        loginButton.permissions = ["public_profile", "email"]
        loginButton.delegate = self
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        if let token = AccessToken.current, !token.isExpired {
            print("status is Login")
        }else{
            print("status is LogOut")
        }
        
        
    }


    // Swift // // Extend the code sample from 6a.Add Facebook Login to Your Code // Add to your viewDidLoad method: loginButton.permissions = ["public_profile", "email"]
}

