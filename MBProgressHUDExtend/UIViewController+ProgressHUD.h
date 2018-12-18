//
//  UIViewController+ProgressHUD.h
//  MBProgressHUDCategory
//
//  Created by Yongqiang Wei on 2018/12/10.
//  Copyright © 2018 Yongqiang Wei. All rights reserved.
//

#import "UIViewController+ProgressHUD.h"
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ProgressHUD)

/** 只显示文字 */
-(void)progressHUDContent:(NSString *)content detailContent:(NSString *)detailConetnt;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end

NS_ASSUME_NONNULL_END
