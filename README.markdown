# Alert Ninja
Invisible UIAlertView and spying.

## How to use

Files copy or Cocoapods.

```
pod 'AlertNinja'
```

## Usage

With OCUnit example.

### Dialog
```objective-c
- (void)showDialog {  
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ninja"
                                                  message:@"doron"
                                                 delegate:nil
                                        cancelButtonTitle:@"YES"
                                        otherButtonTitles:nil];
  [alert show];
}
``

``objective-c
- (void)testDialog
{   
    [[UIAlertView ninja] spy];
    [viewController showDialog];
    UIAlertView *alert = [[[[UIAlertView ninja] report] showedAlerts] lastObject];
    STAssertEqualObjects(@"Ninja", alert.title, @"alert title is Ninja");
    [[UIAlertView ninja] complete];
    
}
``

## Confirm

```objective-c
- (void)showConfirm {    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ninja"
                                                    message:@"Are you Ninja ?"
                                                   delegate:self
                                          cancelButtonTitle:@"NO"
                                          otherButtonTitles:@"YES", @"I'm Kunoichi", nil];
    [alert show];
}
```
and delegate methods

```objective-c
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
    self.calledDidPresent = YES;
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.calledWillDismiss = YES;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    self.calledDidDismiss = YES;
}
```

can simulate button click, use `andSelectIndexAt:`. and called UIAlertViewDelegate methods.

``objective-c
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
```

Happy Testing !

## TODO:
* Support UIActionSheet
* Support UIAlertViewStyle (iOS5.0 later)

