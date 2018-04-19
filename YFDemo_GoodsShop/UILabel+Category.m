//
//  UILabel+Category.m
//  MonkeyKing
//
//  Created by paimwin123 on 2018/3/15.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

/**
 *  获取label高度
 *
 *  @param width 标签宽
 *
 *  @return label高度
 */
- (CGFloat)getHeightWithWidth:(CGFloat)width {
    CGSize labelSize = [self sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    CGFloat height = ceil(labelSize.height) + 1;
    return height;
}

- (CGFloat)getWidth {
    //计算实际宽度
    CGSize size = [self.text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font, NSFontAttributeName,nil]];
    CGFloat labelW = size.width;
    return labelW;
}

- (void)setDifferentColor:(UIColor *)color with:(NSRange)rang {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSForegroundColorAttributeName value:color range:rang];
    self.attributedText = str;
}

- (void)setDifferentFont:(NSInteger)font with:(NSRange)rang {
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.text];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:rang];
    self.attributedText = str;
}


@end
