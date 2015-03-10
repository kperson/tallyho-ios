//
//  Project.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

class Project : Decodable  {
    
//    let name: String
//    let branchDetails: [BranchDetail]
    
    required init(decoder: Decoder) {
        let dict = decoder.dict
        println(dict)
//        self.name = decoder["name"].string!
//        self.branchDetails = DecodableList<BranchDetail>(decoder: decoder["branchDetails"]).list
    }
    
}