//
//  BranchDetail.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

typealias BranchName = String

class BranchDetail : Decodable {
    
    let branch: BranchName
    let numVersions: Int
    let currentVersionIndex: Int?
    let envVariables: [String : String]
    let routes: [Routes]?
    
    required init(decoder: Decoder) {
        self.branch = decoder["branch"].string!
        self.numVersions = decoder["numVersions"].int!
        if let version = decoder["currentVersionIndex"].int {
            self.currentVersionIndex = version
        }
        self.envVariables = decoder["envs"].dict!.items as [String : String]
        self.routes = DecodableList<Routes>(decoder: decoder["routes"]).list
        
    }
}