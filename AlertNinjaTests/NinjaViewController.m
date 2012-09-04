//
//  NinjaViewController.m
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "NinjaViewController.h"

@interface NinjaViewController () <UIAlertViewDelegate>

@end

@implementation NinjaViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)showDialog {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ninja"
                                                    message:@"doron"
                                                   delegate:nil
                                          cancelButtonTitle:@"YES"
                                          otherButtonTitles:nil];
    [alert show];
}

- (void)showConfirm {

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ninja"
                                                    message:@"Are you Ninja ?"
                                                   delegate:self
                                          cancelButtonTitle:@"NO"
                                          otherButtonTitles:@"YES", @"I'm Kunoichi", nil];
    [alert show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UIAlertView

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.calledClickedButtonAtIndex = YES;
    if(buttonIndex == 0) {
        self.result = @"NO";
    }
    else if(buttonIndex == 1) {
        self.result = @"YES";
    }
    else if(buttonIndex == 2) {
        self.result = @"Kunoichi";
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
    self.calledWillPresent = YES;
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
    self.calledDidDismiss = YES;
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.calledWillDismiss = YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.calledDidDismiss = YES;
}

@end
