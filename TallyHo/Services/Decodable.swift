//
//  Decodable.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

protocol Decodable {
    
    init(decoder: Decoder)
    
}


class DecodableList<T:Decodable>: Decodable {
 
    let list: [T]
    
    required init(decoder:Decoder) {
        let arr = decoder.arr!
        list = map(arr) { x in
            T(decoder: x)
        }
    }
    
}