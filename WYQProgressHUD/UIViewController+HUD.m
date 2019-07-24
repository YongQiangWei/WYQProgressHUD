//
//  UIViewController+HUD.m
//  WYQProgressHUD
//
//  Created by YongQiang Wei on 2019/7/24.
//  Copyright © 2019 YongQiang Wei. All rights reserved.
//

#import "UIViewController+HUD.h"
#import "WYQProgressHUD.h"
#import <objc/runtime.h>

NSString * const kHudPropertyKey = @"kViewControllerHud";
@implementation UIViewController (HUD)
@dynamic HUD;

#pragma mark - Stores HUD as instance variable within the ViewController

- (void)setHUD:(MBProgressHUD * )HUD{
    objc_setAssociatedObject(self, (__bridge const void *)(kHudPropertyKey), HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, (__bridge const void *) (kHudPropertyKey));
}

#pragma mark - Show Options

- (void) showHud {
    [self showHudWithTitle:nil andSubtitle:nil animated:YES];
}

- (void) showHudAnimated:(BOOL)animated {
    [self showHudWithTitle:nil andSubtitle:nil animated:animated];
}

- (void) showHudWithTitle:(NSString*)title {
    [self showHudWithTitle:title andSubtitle:nil animated:YES];
}

- (void) showHudWithTitle:(NSString*)title animated:(BOOL)animated {
    [self showHudWithTitle:title andSubtitle:nil animated:animated];
}

- (void) showHudWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle {
    [self showHudWithTitle:title andSubtitle:subtitle animated:YES];
}

- (void) showHudWithTitle:(NSString*)title andSubtitle:(NSString*)subtitle animated:(BOOL)animated {
    
    // Allocate if required...
    BOOL alreadyInstanitated = YES;
    if(![self HUD]) {
        [self setHUD:[[MBProgressHUD alloc] initWithView:[self view]]];
        [[self HUD] setRemoveFromSuperViewOnHide:YES];
        alreadyInstanitated = NO;
    }
    
    // Customize the HUD...
    [[self HUD] setLabelText:(title ? title : NSLocalizedString(@"Loading...", @"Loading..."))];
    if(subtitle) {
        [[self HUD] setDetailsLabelText:subtitle];
    }
    
    // Display the HUD if required...
    if(!alreadyInstanitated) {
        [[self view] addSubview:[self HUD]];
        [[self HUD] show:animated];
    }
    
}

- (void)showHint:(NSString *)hint {
    [Toast showWithText:hint bottomOffset:100 duration:2];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = 200;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

#pragma mark - Hide Options

- (void) hideHud {
    [self hideHudAnimated:YES];
}

- (void) hideHudAnimated:(BOOL)animated {
    if([self HUD]) {
        [[self HUD] hide:animated];
        [self setHUD:nil];
    }
}


@end
