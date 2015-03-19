//
//  LoginViewController.swift
//  TallyHo
//
//  Created by Eric on 3/5/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBackground: UIImageView!
    
    var userManager: UserManager!
    var alphaScreen: UIView?
    
    //TODO - make add endpoint to onboarding
    let endpoint = "https://apps.keltini.com"
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        checkAuthStatus()
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        userManager.login(username: usernameTextField.text, password: passwordTextField.text, endpoint: endpoint)
        .onSuccess { access in
            self.handleSuccessLogin()
        }.onFailure { err in
            self.showError(err.errorMessage)
        }.onComplete { t in
            self.hideLoginAnimation?.start()
            return Void()
        }
        view.endEditing(true)
        showloginAnimation.start()
    }
    
    
    func handleSuccessLogin() {
        self.usernameTextField.clearField()
        self.passwordTextField.clearField()
        let navController = ControllerSource.navigationController()
        navController.pushViewController(ControllerSource.projectListController(), animated: false)
        self.presentViewController(navController, animated: true, completion: nil)
    }
    
    var showloginAnimation: PoppinAnimation {
        let (screen, fadeAnimation) = view.alphaScreen(alpha: 0.5, baseColor: UIColor.whiteColor())
        self.alphaScreen = screen
        
        if let a = self.alphaScreen {
            let indicator = LoginLoggingIndicator.createIndicator("Logging in...")
            indicator.alpha = 0
            a.addToCenter(indicator)
            fadeAnimation ~> indicator.alpaFade(alpha: 1)
        }
        return fadeAnimation
    }
    
    var hideLoginAnimation: PoppinAnimation? {
        return self.alphaScreen.flatMap { a in
            a.fadeOut()
        }
    }
    
    func showError(msg: String) {
        let alertView = UIAlertView(title: "Error!", message: msg, delegate: nil, cancelButtonTitle: "Close")
        alertView.show()
    }
    
    func checkAuthStatus() {
        if let access = userManager.fetchAccess() {
            //This is just for visual effect
            showloginAnimation.start()
            delay(1.second, {
                self.hideLoginAnimation?.start()
                self.handleSuccessLogin()
            })
        }
    }
    
}
