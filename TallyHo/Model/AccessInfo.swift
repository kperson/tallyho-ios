//
//  AccessInfo.swift
//  TallyHo
//
//  Created by Kelton Person on 3/15/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class AccessInfo {
    
    let token: String
    let endpoint: String
    let createdAt: NSDate
    
    convenience init(token: String, endpoint: String) {
        self.init(token: token, endpoint: endpoint, createdAt: NSDate())
    }
    
    init(token: String, endpoint: String, createdAt: NSDate) {
        self.token = token
        self.endpoint = endpoint
        self.createdAt = createdAt
    }
}
