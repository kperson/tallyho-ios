//
//  Services.swift
//  TallyHo
//
//  Created by Eric on 3/5/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

extension HeaderBuilder {
    
    func addAuth() -> HeaderBuilder {
        //TODO
        addCustomHeader("X-TOKEN", value: "5sj5wwi0o29uy2dqsvzgpce690zdnd2zqx1lguak4l26ca9jvy")
        return self
    }
    
}

extension NSError {
    
    var errorMessage:String {
        if let message = self.userInfo?["errorMessage"] as? String {
            return message
        }
        else{
            return "an unexpected error has occurred"
        }
    }
    
}


class Service {
    
    class func endpointUrl(path: String) -> String {
        //TODO - make configurable
        let host = "https://apps.keltini.com"
        if path.hasPrefix("/") {
            return host + path
        }
        else {
            return host + "/" + path
        }
    }
    
    class func checkForServiceErrors(res: RequestResponse) -> Try<RequestResponse> {
        if(res.statusCode < 400) {
            return Try<RequestResponse>.Success(res)
        }
        else  {
            switch res.body.dictDecoderFromJSON {
            case .Success(let decoder):
                let restError = RestError(decoder: decoder())
                let error = NSError(domain: "com.tallyho", code: res.statusCode, userInfo: ["errorMessage" : restError.error])
                return Try<RequestResponse>.Failure(error)
                
            case .Failure(let error):
                return Try<RequestResponse>.Failure(error)
            }
        }
    }
    
    
}

class Services {
    

    
    
    
    class func Login(username: String, password: String, url: String)  {
        var params: Dictionary<String, AnyObject> = ["username" : username, "password" : password]
        let formattedURL = (url + "/auth")
        var defaultHeaders: Dictionary<String, AnyObject> = [:]
        defaultHeaders["Content-Type"] = "application/json"
        defaultHeaders["Accept"] = "application/json"
        ServiceUtil.post(formattedURL, body: Services.asJson(params)!, headers: defaultHeaders).map(Services.checkForRestErrorAndValidJSON).onSuccess { x in
            
            
            let projects = DecodableList<Project>(decoder: x.body.arrDecoderFromJSON.value!).list
            
                println("success")
           
            
            }.onFailure {
                x in
                println("failure")
        }
    }
    
    class func checkForRestErrorAndValidJSON(response: RequestResponse) -> Try<RequestResponse> {
        var error: NSError?
        if response.statusCode >= 500 {
            println("Error: " + response.bodyAsText)
            return Try.Failure(defaultError())
        }
        else if (response.statusCode >= 400) {
            return restError(response)
        }
        else {
            return Try.Success(response)
        }
    }
    
    class func defaultError() -> NSError {
        return NSError(domain: "com.tallyho", code:0, userInfo:["errorMessage": "There was an error with the request"])
    }
    
    private class func restError(response: RequestResponse) -> Try<RequestResponse> {
        if(response.body.length > 0) {
            //let errorJSON = JSON.parse(response.body).value!
            //let finalError = NSError(domain: "com.tallyho", code:0, userInfo:["error": errorJSON["error"].string!])
            return Try.Failure(NSError())
        }
        else {
            return Try.Failure(defaultError())
        }
    }
    
    private class func asJson(obj: AnyObject) -> NSData? {
        var error: NSError?
        return NSJSONSerialization.dataWithJSONObject(obj, options: NSJSONWritingOptions.PrettyPrinted, error: &error)
    }
}
