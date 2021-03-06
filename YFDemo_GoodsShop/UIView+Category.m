//
//  UIView+Category.m
//  Teasing
//
//  Created by paimwin123 on 17/3/7.
//  Copyright © 2017年 paimwin123. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

/**
 *  添加点击事件
 *
 *  @param select 事件触发时的方法
 */
- (void)addTapgestureWithTarget:(id _Nonnull)target action:(nullable SEL)select {
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc] initWithTarget:target action:select];
    [self addGestureRecognizer:tapGes];
    self.userInteractionEnabled = YES;
}

/**
 *  添加阴影
 */
- (void)addShadowWithShadowOpacity:(CGFloat)shadowOpacity shadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowColor = UIColorFromRGB(0xaaafc0).CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(0,0);//shadowOffset阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = shadowOpacity;//阴影透明度，默认0
    self.layer.shadowRadius = shadowRadius;//阴影半径，默认3
}

/**
 *  添加渐变色
 */
- (void)addChangeColorWithColorArray:(NSArray * _Nonnull)colorArray startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint radius:(NSInteger)radius {
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];  // 设置渐变效果
    gradientLayer.bounds = self.bounds;
    gradientLayer.borderWidth = 0;
    
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colorArray;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    [self.layer insertSublayer:gradientLayer atIndex:0];
    gradientLayer.cornerRadius = radius;
}

- (void)changeWithColorArray:(NSArray * _Nonnull)colorArray {
    for (CAGradientLayer *layer in self.layer.sublayers) {
        if ([layer isKindOfClass:[CAGradientLayer class]]) {
            layer.colors = colorArray;
        }
    }
}

@end
