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
    
    @IBOutlet weak var domainLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Services.listProjects()
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonTapped(sender: AnyObject) {
        let userManager = TallyHo.Service.userManager
        userManager.login(username: usernameTextField.text , password: passwordTextField.text , domain: domainLabel.text).onSuccess { token in
            KeychainAccess.save("com.userToken", data: token)
            KeychainAccess.save("com.domain", data: self.domainLabel.text)
            }.onFailure { err in
                println("error: \(err.errorMessage)")
        }
        
    }

}
