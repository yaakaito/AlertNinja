//
//  ANNinjaAgent.h
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ANNinjaReport.h"

@interface ANNinjaAgent : NSObject
+ (id)sharedNinjaAgent;
- (id)spy;
- (ANNinjaReport*)report;
- (void)andSelectIndexAt:(NSInteger)select;
- (void)complete;
@end
