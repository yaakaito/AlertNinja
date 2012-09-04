//
//  ANNinjaAgent.m
//  AlertNinja
//
//  Created by yaakaito on 12/09/05.
//  Copyright (c) 2012年 yaakaito. All rights reserved.
//

#import "ANNinjaAgent.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface ANNinjaAgent()
@property (nonatomic) NSInteger selectIndex;
@property (nonatomic, strong) ANNinjaReport *currentReport;
@property (nonatomic) SEL realShowSelector;
@property (nonatomic) SEL ninjaShowSelector;
- (void)showedAlert:(UIAlertView*)alert;
@end

@implementation UIAlertView(NinjaAgent)
- (void)ninjaAgent_show {
    [[ANNinjaAgent sharedNinjaAgent] showedAlert:self];
}
@end

@implementation ANNinjaAgent

+ (void)swapInstanceMethodsForClass: (Class) cls selector: (SEL)sel1 andSelector: (SEL)sel2 {
    Method method1 = class_getInstanceMethod(cls, sel1);
    Method method2 = class_getInstanceMethod(cls, sel2);
    method_exchangeImplementations(method1, method2);
}


+ (id)sharedNinjaAgent {
    
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
        [((ANNinjaAgent*)_sharedObject) setup];
    });
    return _sharedObject;    
}

- (void)setup {
    self.realShowSelector = @selector(show);
    self.ninjaShowSelector = @selector(ninjaAgent_show);
}


- (void)fetchMethods {
    
    [ANNinjaAgent swapInstanceMethodsForClass:[UIAlertView class] selector:self.realShowSelector andSelector:self.ninjaShowSelector];
}

- (id)spy {
    self.currentReport = [[ANNinjaReport alloc] init];
    self.selectIndex = 0;
    [self fetchMethods];
    
    return self;
}

- (ANNinjaReport *)report {
    return self.currentReport;
}

- (void)andSelectIndexAt:(NSInteger)select {
    self.selectIndex = select;
}

- (void)showedAlert:(UIAlertView *)alert {
    
    [self.currentReport.showedAlerts addObject:alert];
    
    NSObject<UIAlertViewDelegate> *delegate = [alert delegate];
   
    if(!delegate) {
        return ;
    }
    
    if([delegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [delegate willPresentAlertView:alert];
    }
    
    if([delegate respondsToSelector:@selector(didPresentAlertView:)]) {
        [delegate didPresentAlertView:alert];
    }

    if([delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [delegate alertView:alert clickedButtonAtIndex:self.selectIndex];
    }

    if([delegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [delegate alertView:alert willDismissWithButtonIndex:self.selectIndex];
    }

    if([delegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [delegate alertView:alert didDismissWithButtonIndex:self.selectIndex];
    }
}

- (void)complete {
    
    [self fetchMethods];
}


@end
