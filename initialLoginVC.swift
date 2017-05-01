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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
