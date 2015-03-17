//
//  LoginLoggingIndicator.swift
//  TallyHo
//
//  Created by Kelton Person on 3/17/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class LoginLoggingIndicator : UIView {
    
    @IBOutlet weak var loadingLabel: UILabel!
    
    class func createIndicator(label: String) -> LoginLoggingIndicator {
        let indicator = NSBundle.mainBundle().loadNibNamed("LoginLoggingIndicator", owner: nil, options: nil).first! as LoginLoggingIndicator
        indicator.loadingLabel.text = label
        return indicator
    }
    
}