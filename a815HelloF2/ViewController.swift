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
        do {
            try Auth.auth().signOut()
        } catch {
            print("Sign Out error:\(error.localizedDescription)")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let token = AccessToken.current, !token.isExpired {
            print("status is Login")
            let token = AccessToken.current
            let credential = FacebookAuthProvider
              .credential(withAccessToken: token!.tokenString)
            
            Auth.auth().signIn(with: credential) { result, error in
                print("try signIn Firebase")
                
            }
        }else{
            print("status is LogOut")
        }
        
        
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                print("Sign in with:\(user.displayName)")
            }else{
                print("Sign in with:Fail")
            }
        }
        
        let loginButton = FBLoginButton()
        loginButton.permissions = ["public_profile", "email"]
        loginButton.delegate = self
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)

        
        
        
        
    }


}

