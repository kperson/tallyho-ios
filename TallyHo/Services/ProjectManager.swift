//
//  File.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

protocol ProjectManager {

    func projects() -> Future<[Project]>
    
}


class RestProjectManager : ProjectManager {
    
    func projects() -> Future<[Project]> {
        let headers = HeaderBuilder().acceptJSON().addAuth().build()
        let projectUrl = Service.endpointUrl("/projects")
        return ServiceUtil.get(projectUrl, headers: headers)
        .map(Service.checkForServiceErrors)
        .map { res in
            let decoder = res.body.arrDecoderFromJSON.value!
            let projects = DecodableList<Project>(decoder: decoder).list
            return Try.Success(projects)
        }
    }
}