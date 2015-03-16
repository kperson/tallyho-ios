//
//  TallyButton.swift
//  TallyHo
//
//  Created by Kelton Person on 3/16/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation
import UIKit

class TallyButton : UIButton {
    
    @IBInspectable var baseColor: String?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let bg = Colors.colorLookup(baseColor)
        backgroundColor = bg
    }

}
