//
//  NSData+Decoder.swift
//  TallyHo
//
//  Created by Kelton Person on 3/9/15.
//  Copyright (c) 2015 TallyHo. All rights reserved.
//

import Foundation

extension NSData {
    
    var arrDecoderFromJSON:Try<Decoder> {
        var error: NSError?
        let list = NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.AllowFragments, error: &error) as [AnyObject]
        if let err = error {
            return Try.Failure(err)
        }
        else {
            return Try.Success(Decoder(array: list, depth: 0))
        }
    }
    
    var dictDecoderFromJSON:Try<Decoder> {
        var error: NSError?
        let dict = NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.AllowFragments, error: &error) as [String : AnyObject]
        if let err = error {
            return Try.Failure(err)
        }
        else {
            return Try.Success(Decoder(dictionary: dict, depth: 0))
        }
    }

    var isJSONDecodable:Bool {
        var error: NSError?
        let dict = NSJSONSerialization.JSONObjectWithData(self, options: NSJSONReadingOptions.AllowFragments, error: &error) as [String : AnyObject]
        if let err = error {
            return false
        }
        else {
            return true
        }
    }
    
}