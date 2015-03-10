//
//  HeaderBuilder.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class HeaderBuilder {
    
    private var headers:[String : AnyObject] = [:]
    
    func addCustomHeader(key: String, value: AnyObject) -> HeaderBuilder {
        headers[key] = value
        return self
    }
    
    func build() -> [String: AnyObject] {
        return headers
    }
    
}

extension HeaderBuilder {
    
    func sendJSON() -> HeaderBuilder {
        return addCustomHeader("Content-Type", value: "application/json; charset=utf-8")
    }
    
    func acceptJSON() -> HeaderBuilder {
        return addCustomHeader("Accept", value: "application/json")
    }

}