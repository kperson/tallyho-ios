//
//  UserManager.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

protocol UserManager {
    
    func login(#username: String, password: String, endpoint: String) -> Future<AccessInfo>
    func saveAccess(access: AccessInfo)
    func fetchAccess() -> AccessInfo?
    var isAuthenticated: Bool { get }
    func deleteAccess() -> Future<Void>
    
}

class RestUserManager : UserManager {
    
    func login(#username: String, password: String, endpoint: String) -> Future<AccessInfo> {
        return loginCall(username: username, password: password, endpoint: endpoint).map( { (token) -> Try<AccessInfo> in
            let accessInfo = AccessInfo(token: token, endpoint: endpoint)
            self.saveAccess(accessInfo)
            return Try.Success(accessInfo)
        })
    }
    
    private func loginCall(#username: String, password: String, endpoint: String) -> Future<String> {
        let headers = HeaderBuilder().acceptJSON().sendJSON().build()
        let loginUrl = Service.endpointUrl("/auth", endpoint: endpoint)
        let loginRequest = [ "username" : username, "password" : password]
        let requestBody = ServiceUtil.asJson(loginRequest)!
        return ServiceUtil.post(loginUrl, body: requestBody, headers: headers)
        .map(Service.checkForServiceErrors)
        .map { res in
            let decoder = res.body.dictDecoderFromJSON.value!
            return Try.Success(LoginToken(decoder: decoder).token)
        }
    }
    
    var isAuthenticated: Bool {
        return fetchAccess() != nil
    }
    
    func fetchAccess() -> AccessInfo? {
        if let token = KeychainAccess.load("com.token") as? String {
            let endpoint = KeychainAccess.load("com.endpoint") as String
            let createdAt = KeychainAccess.load("com.createdAt") as NSDate
            return AccessInfo(token: token, endpoint:endpoint, createdAt:createdAt)
        }
        else {
            return nil
        }
    }
    
    func saveAccess(access: AccessInfo) {
        KeychainAccess.save("com.token", data: access.token)
        KeychainAccess.save("com.endpoint", data: access.endpoint)
        KeychainAccess.save("com.createdAt", data: access.createdAt)
    }
    
    func deleteAccess() -> Future<Void> {
        let headers = HeaderBuilder().addAuth().acceptJSON().build()
        let logoutUrl = Service.endpointUrl("/auth")
        KeychainAccess.remove("com.token")
        KeychainAccess.remove("com.endpoint")
        KeychainAccess.remove("com.createdAt")
        return ServiceUtil.delete(logoutUrl, headers: headers)
            .map(Service.checkForServiceErrors)
            .map { x in Try.Success(Void()) }
    }
    
}