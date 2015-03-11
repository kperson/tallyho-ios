//
//  TallyHo.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

struct TallyHo {
    
    struct Service {
        static var projectManager: ProjectManager = RestProjectManager()
        static var userManager: UserManager = RestUserManager()
    }
}