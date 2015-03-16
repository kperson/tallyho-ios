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
    
    //TODO - make add endpoint to onboarding
    let endpoint = "https://apps.keltini.com"
    
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        userManager.login(username: usernameTextField.text, password: passwordTextField.text, endpoint: endpoint)
        .onSuccess { access in
            println("TODO")
        }.onFailure { err in
            println("error: \(err.errorMessage)")
        }
    }
    
    
}
