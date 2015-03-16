//
//  Colors.swift
//  TallyHo
//
//  Created by Kelton Person on 3/16/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    
    class func primaryColor() -> UIColor {
        return UIColor.orangeColor()
    }
    
    class func colorLookup(key: String?) -> UIColor? {
        if let k = key {
            let dict = [
                "primaryColor" : primaryColor()
            ]
            return dict[k]
        }
        else {
            return nil
        }
    }
    
}