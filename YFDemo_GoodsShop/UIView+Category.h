//
//  UIView+Category.h
//  Teasing
//
//  Created by paimwin123 on 17/3/7.
//  Copyright © 2017年 paimwin123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;

/**
 *  添加点击事件
 *
 *  @param select 事件触发时的方法
 */
- (void)addTapgestureWithTarget:(id _Nonnull)target action:(nullable SEL)select;

/**
 *  添加阴影
 */
- (void)addShadowWithShadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius;

/**
 *  添加渐变色
 */
- (void)addChangeColorWithColorArray:(NSArray * _Nonnull)colorArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint radius:(NSInteger)radius;

/**
 *  改变渐变色
 */
- (void)changeWithColorArray:(NSArray * _Nonnull)colorArray;

@end
