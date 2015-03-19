//
//  RootNavigationController.swift
//  TallyHo
//
//  Created by Kelton Person on 3/19/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import UIKit

class RootNavigationController: UINavigationController, UINavigationControllerDelegate {

    
    var userManager: UserManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
    
        if let tv = self.topViewController {
            addLogoutButton()
        }
    }
    

    
    func addLogoutButton() {
        let logoutButton = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        logoutButton.frame = CGRectMake(0, 0, 20, 20)
        logoutButton.addTarget(self, action: "didTapLogout", forControlEvents: UIControlEvents.TouchUpInside)
        logoutButton.titleLabel?.font = UIFont(name: "FontAwesome", size: 22)
        logoutButton.setTitle("\u{f08b}", forState: UIControlState.Normal)
        logoutButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        logoutButton.setTitleColor(UIColor.whiteColor().colorWithAlphaComponent(0.4), forState: UIControlState.Highlighted)
        let logutBarButton = UIBarButtonItem(customView: logoutButton)
        self.topViewController.navigationItem.setRightBarButtonItems([logutBarButton], animated: true)
    }
    
    func didTapLogout() {
        userManager.deleteAccess()
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
