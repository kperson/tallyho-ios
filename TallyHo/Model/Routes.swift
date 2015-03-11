//
//  Routes.swift
//  TallyHo
//
//  Created by Eric on 3/10/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

class Routes : Decodable {
    let ssl: Bool?
    let servicePort: Int?
    let host: String?
    let app: String?
    
    required init(decoder: Decoder) {
        self.host = decoder["host"].string?
        self.servicePort = decoder["servicePort"].int?
        self.app = decoder["app"].string?
        self.ssl = decoder["ssl"].bool?
    }
    
}
