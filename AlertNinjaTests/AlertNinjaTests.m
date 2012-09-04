//
//  AlertNinjaTests.m
//  AlertNinjaTests
//
//  Created by yaakaito on 12/09/04.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "AlertNinjaTests.h"
#import "NinjaViewController.h"
#import "AlertNinja.h"

@implementation AlertNinjaTests {
    
    NinjaViewController *viewController;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    viewController = [[NinjaViewController alloc] init];
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

- (void)testDialog
{
    
    [[[UIAlertView ninja] spy] andSelectAt:2];
    [viewController showDialog];
    UIAlertView *alert = [[[[UIAlertView ninja] report] showedAlerts] lastObject];
    STAssertEqualObjects(@"Ninja", alert.title, @"alert title is Ninja");
    [[UIAlertView ninja] complete];
    STAssertTrue(viewController.calledWillPresent, @"called will present delegate method");
    STAssertTrue(viewController.calledDidPresent, @"called did present delegate method");
    STAssertTrue(viewController.calledWillDismiss, @"called will dismiss delegate method");
    STAssertTrue(viewController.calledDidDismiss, @"called did dismiss delegate method");
    STAssertTrue(viewController.calledClickedButtonAtIndex, @"called did clicked button at Index");
    STAssertEqualObjects(@"Kunoichi", viewController.result, @"result is 'Kunoichi'");
}

@end
