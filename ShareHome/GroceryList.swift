//
//  GroceryList.swift
//  ShareHome
//
//  Created by Meiirbek Ashirgaziyev on 4/6/17.
//  Copyright © 2017 Meiirbek Ashirgaziyev. All rights reserved.
//

import Foundation

class GroceryList: UIViewController {
    
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
        
        self.navigationItem.title = "Grocery List"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : Any]
        
        self.navigationController?.navigationBar.layer.masksToBounds = false
        self.navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        self.navigationController?.navigationBar.layer.shadowOpacity = 0.8
        self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer.shadowRadius = 2
    }
}
