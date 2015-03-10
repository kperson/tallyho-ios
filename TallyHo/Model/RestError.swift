//
//  RestError.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class RestError {
    
    let error: String
    
    init(decoder: Decoder) {
        self.error = decoder["error"].string!
    }
    
}