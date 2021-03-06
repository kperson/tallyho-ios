//
//  CurrentApps.swift
//  TallyHo
//
//  Created by Eric on 3/10/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

class CurrentApp : Decodable {
    
    let name: String
    let file: String
    let command: String
    let memory: Int
    let dockerRev: String
    let ports: [PortMapping]
    
    required init(decoder: Decoder) {
        self.name = decoder["name"].string!
        self.file = decoder["file"].string!
        self.command = decoder["command"].string!
        self.memory = decoder["memory"].int!
        self.dockerRev = decoder["dockerRev"].string!
        self.ports = DecodableList<PortMapping>(decoder: decoder["ports"]).list
    }
    
}