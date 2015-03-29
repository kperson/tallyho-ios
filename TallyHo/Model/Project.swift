//
//  Project.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class Project : Decodable  {
    
    let name: String
    let branchDetails: [BranchDetail]
    
    required init(decoder: Decoder) {
        self.name = decoder["name"].string!
        self.branchDetails = DecodableList<BranchDetail>(decoder: decoder["branchDetails"]).list
    }
    
}

extension Project {

    var projectAndBranch:[(BranchName, Project)] {
        return self.branchDetails
        .map { b in (b.branch, self) }
        .sorted { (a, b) in a.0 < b.0 }
    }
    
    subscript(branch: BranchName) -> BranchDetail {
        return self.branchDetails.findFirst { x in x.branch == branch }!
    }
    
}