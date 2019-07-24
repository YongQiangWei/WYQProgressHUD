//
//  UIViewController+HUD.h
//  WYQProgressHUD
//
//  Created by YongQiang Wei on 2019/7/24.
//  Copyright © 2019 YongQiang Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MBProgressHUD;
@interface UIViewController (HUD)
@property (nonatomic, strong) MBProgressHUD *HUD;

#pragma mark - Show Options

- (void) showHud; // Shows "Loading" by default + animated
- (void) showHudAnimated:(BOOL)animated; // Shows "Loading" by default, optional animation
- (void) showHudWithTitle:(NSString* _Nullable )title; // Animated by default
- (void) showHudWithTitle:(NSString* _Nullable )title animated:(BOOL)animated;
- (void) showHudWithTitle:(NSString* _Nullable )title andSubtitle:(NSString* _Nullable )subtitle; // Animated by default
- (void) showHudWithTitle:(NSString* _Nullable )title andSubtitle:(NSString* _Nullable )subtitle animated:(BOOL)animated;

- (void) showHint:(NSString *) hint;
// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;
#pragma mark - Hide Options

- (void) hideHud; // Animated by default
- (void) hideHudAnimated:(BOOL)animated;



@end

NS_ASSUME_NONNULL_END
