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
    
    
    class func projectListController() -> ProjectListController {
        let projectListController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProjectListControllerId") as ProjectListController
        projectListController.projectManager = TallyHo.Service.projectManager
        return projectListController
    }
    
    class func navigationController() -> UINavigationController {
        let navController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("RootNavigationControllerId") as RootNavigationController
        navController.userManager = TallyHo.Service.userManager
        return navController
    }
    
    class func branchController(detail: BranchDetail, projectName: String) -> ProjectController {
        let projectController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ProjectControllerId") as ProjectController
        projectController.detail = detail
        projectController.projectName = projectName
        return projectController
    }
        
}