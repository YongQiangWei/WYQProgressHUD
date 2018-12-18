//
//  MBProgressHUD+OperationHUD.h
//  MBProgressHUDCategory
//
//  Created by Yongqiang Wei on 2018/12/10.
//  Copyright © 2018 Yongqiang Wei. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (OperationHUD)

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
