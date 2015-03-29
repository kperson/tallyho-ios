//
//  BranchDetail.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

typealias BranchName = String

class BranchDetail : Decodable  {
    
    let branch: BranchName
    let numVersions: Int
    let currentVersionIndex: Int?
    let envVariables: [String : String]
    let routes: [Routes]
    let currentApps: [CurrentApp]
    
    
    init(branch: String, numVersions: Int, envVariables: [String : String], routes: [Routes], currentApps: [CurrentApp], currentVersionIndex: Int?) {
        self.branch = branch
        self.numVersions = numVersions
        self.envVariables = envVariables
        self.routes = routes
        self.currentApps = currentApps
    }
    
    convenience required init(decoder: Decoder) {
        let branch = decoder["branch"].string!
        let numVersions = decoder["numVersions"].int!
        let version = decoder["currentVersionIndex"].int
        let envVariables = decoder["envs"].dict!.items as [String : String]
        let routes = DecodableList<Routes>(decoder: decoder["routes"]).list
        let currentApps = decoder["currentApps"].arr.flatMap { x in DecodableList<CurrentApp>(decoder: decoder["currentApps"]).list } ?? []
        self.init(branch: branch, numVersions: numVersions, envVariables: envVariables, routes: routes, currentApps: currentApps, currentVersionIndex: version)
    }
    
}