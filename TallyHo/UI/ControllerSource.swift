//
//  ControllerFactory.swift
//  TallyHo
//
//  Created by Kelton Person on 3/16/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation
import UIKit

class ControllerSource {
    
    class func loginController() -> LoginViewController {
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("LoginViewControllerId") as LoginViewController
        loginController.userManager = TallyHo.Service.userManager
        return loginController
    }
    
}