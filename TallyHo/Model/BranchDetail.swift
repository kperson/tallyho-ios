//
//  BranchDetail.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class BranchDetail : Decodable {
    
    let branch: String
    let numVersions: Int
    let currentVersionIndex: Int?
    let envVariables:[String : String]
    
    required init(decoder: Decoder) {
        self.branch = decoder["branch"].string!
        self.numVersions = decoder["numVersions"].int!
        if let version = decoder["currentVersionIndex"].int {
            self.currentVersionIndex = version
        }
        self.envVariables = decoder["envs"].dict!.items as [String : String]
    }
}