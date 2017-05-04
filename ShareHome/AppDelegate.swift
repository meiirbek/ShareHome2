//
//  AppDelegate.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/14/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let APP_ID = "19E73C32-D357-313A-FF64-12612084E000"
    let SECRET_KEY = "3EBF3C7D-B0BE-84BD-FF0A-695F6A372200"
    let VERSION_NUM = "v1"
    
    var backendless = Backendless.sharedInstance()
    var fault:Fault?

    var window: UIWindow?


    @available(iOS, introduced: 4.2, deprecated: 9.0, message: "Please use application:openURL:options:")
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        
        print("AppDelegate (< iOS9) -> application:openURL: \(url.scheme), [\(sourceApplication) -> \(annotation)]")
        
        let result = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        if result {
//            
//                        let token = FBSDKAccessToken.current()
//                        if token == nil {
//                            print("ERROR: token = \(token)")
//                            return false
//                        }
//            
//                        let fieldsMapping = [
//                            "id" : "id",
//                            "name" : "name",
//                            "first_name": "firstName",
//                            "last_name" : "lastName",
//                            "gender": "gender",
//                            "email": "email"
//                        ]
//            
//                        if let permissions = token?.value(forKey: "permissions") {
//                            print("ACCOUNT PERMISSIONS: \(permissions)")
//                        }
//            
//                        backendless!.userService.login(
//                            withFacebookSDK: token,
//                            permissions: ["user_friends", "email", "public_profile", "contact_email"],
//                            fieldsMapping: fieldsMapping,
//                            response: { (user: BackendlessUser?) -> Void in
//                                print("user: \(user!.email)\n[\(user!.retrieveProperties())]")
//                                self.validUserTokenSync()
//                            },
//                            error: { (fault: Fault?) -> Void in
//                                print("Server reported an error: \(fault)")
//                        })
        }
        
        return result
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        backendless?.initApp(APP_ID, secret:SECRET_KEY, version:VERSION_NUM)
        // If you plan to use Backendless Media Service, uncomment the following line (iOS ONLY!)
        // backendless.mediaService = MediaService()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
       application.statusBarStyle = .lightContent
        
        
        if (UserDefaults.standard.value(forKey: "username") as? String) == nil {
            self.goToViewController("initialLoginVC")
        } else {
            self.goToViewController("revealVC")
        }
        
        self.window?.makeKeyAndVisible()
        
        FBSDKApplicationDelegate.sharedInstance().application(application,
                                                                     didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func validUserTokenSync() {
        
        Types.tryblock({ () -> Void in
            
            let result = self.backendless!.userService.isValidUserToken() //as NSNumber
            
            print("isValidUserToken (SYNC): \((result! as NSNumber).boolValue)")
        },
                       
                       catchblock: { (exception) -> Void in
                        self.fault = exception as? Fault
                        print("Server reported an error (SYNC): \(self.fault!)")
        }
        )
    }
    
    func validUserTokenAsync() {
        
        backendless!.userService.isValidUserToken(
            { ( result : AnyObject?) -> () in
                print("isValidUserToken (ASYNC): \((result as! NSNumber).boolValue)")
        },
            error: { ( fault : Fault?) -> () in
                self.fault = fault
                print("Server reported an error (ASYNC): \(fault)")
        }
        )
    }
    func goToViewController(_ storyboardId: String){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: storyboardId)
        self.window?.rootViewController = vc
    }


    
}

