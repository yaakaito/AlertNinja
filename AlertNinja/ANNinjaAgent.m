//
//  ANNinjaAgent.m
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "ANNinjaAgent.h"

@implementation ANNinjaAgent

+ (id)sharedNinjaAgent {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;    
}
@end
