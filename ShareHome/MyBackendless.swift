//
//  MyBackendless.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/30/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation


class MyBackendless {
    
    let backendless = Backendless.sharedInstance()
    
    func test(token: FBSDKAccessToken) {
        
        let fieldsMapping = [
            "id" : "id",
            "name" : "name",
            "first_name": "firstName",
            "last_name" : "lastName",
            "gender": "gender",
            "email": "email"
        ]
        
        if let permissions = token.value(forKey: "permissions") {
            print("ACCOUNT PERMISSIONS: \(permissions)")
        }
        
        backendless!.userService.login(
            withFacebookSDK: token,
            permissions: ["user_friends", "email", "public_profile", "contact_email"],
            fieldsMapping: fieldsMapping,
            response: { (user: BackendlessUser?) -> Void in
                print("user: \(user!.email)\n[\(user!.retrieveProperties())]")
                self.validUserTokenSync()
        },
            error: { (fault: Fault?) -> Void in
                print("Server reported an error: \(fault)")
        })
    }
    
    
    func validUserTokenSync() {
        
        Types.tryblock({ () -> Void in
            
            let result = self.backendless!.userService.isValidUserToken() //as NSNumber
            print("isValidUserToken (SYNC): \((result! as NSNumber).boolValue)")
        },
                       
                       catchblock: { (exception) -> Void in
                        let fault = exception as? Fault
                        print("Server reported an error (SYNC): \(fault!)")
        }
        )
    }
}
