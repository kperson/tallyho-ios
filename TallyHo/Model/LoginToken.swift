//
//  LoginToken.swift
//  TallyHo
//
//  Created by Kelton Person on 3/10/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class LoginToken : Decodable {
    
    let token: String
    
    required init(decoder: Decoder) {
        self.token = decoder["token"].string!
    }
    
}