//
//  UIViewController+Category.h
//  MonkeyKing
//
//  Created by paimwin123 on 2018/3/15.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

@property (nonatomic, assign, readonly) CGFloat navHeight;

/**
 *  设置背景色
 */
- (void)setBackgroundColor:(UIColor * _Nonnull)color;

/**
 *  设置返回按钮
 */
- (void)setLeftBarButtonItem;

/**
 *  设置返回按钮
 */
- (void)setLeftBarButtonItemWithTitle:(NSString *_Nullable)title;

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithImage:(NSString *_Nullable)imageString action:(nullable SEL)action;

/**
 *  设置右按钮
 */
- (void)setRightBarButtonItemWithTitle:(NSString *_Nullable)title action:(nullable SEL)action;

/**
 *  更改导航栏字体颜色
 */
- (void)setTitleWithColor:(UIColor *_Nonnull)color font:(UIFont *_Nonnull)font;

/**
 *显示提示
 *@param    text 提示内容
 */
- (void)showToast:(NSString * _Nonnull)text;

/**
 *移除提示
 */
- (void)removeToast;

@end
