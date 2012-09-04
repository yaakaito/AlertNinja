//
//  NinjaTestAppTests.m
//  NinjaTestAppTests
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "NinjaTestAppTests.h"
#import "ViewController.h"
#import "AlertNinja.h"

@implementation NinjaTestAppTests {
    
    ViewController *viewController;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    
    viewController = [[ViewController alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testDialog
{
    
    [[UIAlertView ninja] spy];
    [viewController showDialog];
    UIAlertView *alert = [[[[UIAlertView ninja] report] showedAlerts] lastObject];
    STAssertEqualObjects(@"Ninja", alert.title, @"alert title is Ninja");
    [[UIAlertView ninja] complete];
    
}


- (void)testConfirm
{
    
    [[[UIAlertView ninja] spy] andSelectIndexAt:2];
    [viewController showConfirm];
    UIAlertView *alert = [[[[UIAlertView ninja] report] showedAlerts] lastObject];
    STAssertEqualObjects(@"Ninja", alert.title, @"alert title is Ninja");
    
    STAssertTrue(viewController.calledWillPresent, @"called will present delegate method");
    STAssertTrue(viewController.calledDidPresent, @"called did present delegate method");
    STAssertTrue(viewController.calledWillDismiss, @"called will dismiss delegate method");
    STAssertTrue(viewController.calledDidDismiss, @"called did dismiss delegate method");
    STAssertTrue(viewController.calledClickedButtonAtIndex, @"called did clicked button at Index");
    STAssertEqualObjects(@"Kunoichi", viewController.result, @"result is 'Kunoichi'");
    
    [[UIAlertView ninja] complete];
    
}



@end
