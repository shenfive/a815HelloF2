//
//  ViewController.swift
//  a815HelloF2
//
//  Created by 申潤五 on 2021/8/22.
//


// Swift // // Add this to the header of your file, e.g. in ViewController.swift import FBSDKLoginKit // Add this to the body class ViewController:UIViewController { override func viewDidLoad() { super.viewDidLoad() let loginButton = FBLoginButton() loginButton.center = view.center view.addSubview(loginButton) } }



import FBSDKLoginKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }


}

