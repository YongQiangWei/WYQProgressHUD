//
//  UIViewController+ProgressHUD.m
//  MBProgressHUDCategory
//
//  Created by Yongqiang Wei on 2018/12/10.
//  Copyright © 2018 Yongqiang Wei. All rights reserved.
//

#import "UIViewController+ProgressHUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
#import "Toast.h"
static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (ProgressHUD)

-(void)progressHUDContent:(NSString *)content detailContent:(NSString *)detailConetnt{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        HUD.mode = MBProgressHUDModeText;
        HUD.labelText = content;
        HUD.detailsLabelText = detailConetnt;
        [HUD hide:YES afterDelay:3];
    });
}

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
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

- (void)hideHud{
    [[self HUD] hide:YES];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
@end
