//
//  initialLoginVC.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/16/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class initialLoginVC: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpPressed(_ sender: UIButton) {
//        UserDefaults.standard.set(loginName.text, forKey: "username")
//        performSegue(withIdentifier: "toMainSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        signUpButton.layer.cornerRadius = 5
//        signUpButton.clipsToBounds = true
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        loginButton.delegate = self   
    }
    
   
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let token = FBSDKAccessToken.current() {
            MyBackendless().test(token: token);
        }
        performSegue(withIdentifier: "toMainSegue", sender: nil)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("LOGGED OUT")
    }
  
}
