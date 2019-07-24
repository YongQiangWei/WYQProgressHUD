//
//  MBProgressHUD+HUD.h
//  WYQProgressHUD
//
//  Created by YongQiang Wei on 2019/7/24.
//  Copyright © 2019 YongQiang Wei. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (HUD)
+ (void)showSuccess:(NSString *)success toView:(UIView * __nullable)view;

+ (void)showError:(NSString *)error toView:(UIView * __nullable)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView * __nullable)view;

+ (void)showSuccess:(NSString *)success;

+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView * __nullable)view;

+ (void)hideHUD;

+ (void)showAlertMessage:(NSString *)alert;
@end

NS_ASSUME_NONNULL_END
