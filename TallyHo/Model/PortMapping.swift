//
//  Ports.swift
//  TallyHo
//
//  Created by Eric on 3/10/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

class PortMapping : Decodable {
    
    let containerPort: Int
    let servicePort: Int
    
    required init(decoder: Decoder) {
        self.containerPort = decoder["containerPort"].int!
        self.servicePort = decoder["servicePort"].int!
    }
    
}