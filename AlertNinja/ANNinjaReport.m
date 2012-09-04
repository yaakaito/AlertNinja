//
//  ANNinjaReport.m
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "ANNinjaReport.h"

@implementation ANNinjaReport

- (id)init {
    self = [super init];
    if(self) {
        self.showedAlerts = [NSMutableArray array];
    }
    return self;
}
@end
