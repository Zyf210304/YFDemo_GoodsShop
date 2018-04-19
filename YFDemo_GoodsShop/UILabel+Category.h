//
//  UILabel+Category.h
//  MonkeyKing
//
//  Created by paimwin123 on 2018/3/15.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 *  获取label高度
 *
 *  @param width 标签宽
 *
 *  @return label高度
 */
- (CGFloat)getHeightWithWidth:(CGFloat)width;

- (CGFloat)getWidth;

- (void)setDifferentColor:(UIColor *)color with:(NSRange)rang;

- (void)setDifferentFont:(NSInteger)font with:(NSRange)rang;

@end
