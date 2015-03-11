//
//  KeychainAccess.h
//  questionapp
//
//  Created by Kelton Person on 11/17/14.
//  Copyright (c) 2014 Question App. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainAccess : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;
+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)remove:(NSString *)service;


@end
