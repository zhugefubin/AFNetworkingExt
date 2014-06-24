//
//  AFTextResponseSerializer.m
//  AFNetworking-Base
//
//  Created by yangjunhai on 14-3-27.
//  Copyright (c) 2014年 soooner. All rights reserved.
//

#import "AFTextResponseSerializer.h"

@implementation AFTextResponseSerializer

+ (instancetype)serializer {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/xml", @"application/xml", nil];
    
    return self;
}

#pragma mark - AFURLResponseSerialization

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        return nil;
    }
    
    id responseObject = nil;
    NSError *serializationError = nil;
    
    if (!responseObject) {
        responseObject = [[NSString alloc] initWithBytes:[data bytes] length:data.length encoding:NSUTF8StringEncoding];
    } 
    
    if (error) {
        *error = serializationError;
    }
    
    return responseObject;
}

@end
