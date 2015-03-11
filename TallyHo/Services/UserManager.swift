//
//  UserManager.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

protocol UserManager {
    
    func login(#username: String, password: String) -> Future<String>
    
}

class RestUserManager : UserManager {
    
    func login(#username: String, password: String) -> Future<String> {
        let headers = HeaderBuilder().acceptJSON().sendJSON().build()
        let loginUrl = Service.endpointUrl("/auth")
        let loginRequest = [ "username" : username, "password" : password ]
        let requestBody = ServiceUtil.asJson(loginRequest)!
        return ServiceUtil.post(loginUrl, body: requestBody, headers: headers)
        .map(Service.checkForServiceErrors)
        .map { res in
            let decoder = res.body.dictDecoderFromJSON.value!
            return Try.Success(LoginToken(decoder: decoder).token)
        }
    }
    
}