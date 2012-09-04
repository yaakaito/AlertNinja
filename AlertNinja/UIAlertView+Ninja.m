//
//  UIAlertView+Ninja.m
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "UIAlertView+Ninja.h"
#import "ANNinjaAgent.h"

@implementation UIAlertView (Ninja)

+ (id)ninja {
    return [ANNinjaAgent sharedNinjaAgent];
}
@end
