//
//  NinjaViewController.h
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NinjaViewController : UIViewController

@property (nonatomic) BOOL calledClickedButtonAtIndex;
@property (nonatomic, strong) NSString *result;
@property (nonatomic) BOOL calledWillPresent;
@property (nonatomic) BOOL calledDidPresent;
@property (nonatomic) BOOL calledWillDismiss;
@property (nonatomic) BOOL calledDidDismiss;
- (void)showDialog;
- (void)showConfirm;
@end
