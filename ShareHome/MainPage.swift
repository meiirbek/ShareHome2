//
//  MainPage.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 3/16/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class MainPage: UIViewController {
    
    override func viewDidLoad() {
//        let button = UIButton.init(type: .custom)
//        button.setImage(UIImage(named: "burger.png"), for: UIControlState.normal)
//        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
//        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
//        let barButton = UIBarButtonItem(customView: button)
//        self.navigationItem.leftBarButtonItem = barButton
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        let origImage = UIImage(named: "burger.png")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        
        
        let button = UIButton.init(type: .custom)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .white
        
        //        button.setImage(UIImage(named: "burger.png"), for: UIControlState.normal)
        
        button.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: UIControlEvents.touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.navigationItem.title = "Home"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
    }
}
