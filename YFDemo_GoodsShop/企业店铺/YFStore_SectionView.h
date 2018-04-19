//
//  YFStore_SectionView.h
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/4.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YFStore_SectionView : UIView

@property (nonatomic, copy) void(^typeDidChoose)(NSInteger index);

- (void)changeStateWith:(NSInteger )index;

@end
