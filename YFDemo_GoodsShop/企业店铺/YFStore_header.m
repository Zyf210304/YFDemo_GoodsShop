//
//  YFStore_header.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/4.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFStore_header.h"

@interface YFStore_header()

@property (nonatomic, strong) UILabel *collectionLbl;
@property (nonatomic, strong) UILabel *collectionNum;

@property (nonatomic, strong) UIImageView *storeIcon;

@property (nonatomic, strong) UILabel *storeName;

@property (nonatomic, strong) UIImageView *BGImg;

@end

@implementation YFStore_header


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {

    self.BGImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:self.BGImg];

    self.storeIcon = [[UIImageView alloc] initWithFrame:CGRectMake(15 *SCALE_375, self.height - 60 *SCALE_375, 45 *SCALE_375, 45 *SCALE_375)];
    self.storeIcon.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.storeIcon];

    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(65 *SCALE_375, self.storeIcon.y, FRAME_WIDTH - 160 *SCALE_375, 45 *SCALE_375)];
    centerView.backgroundColor = YFRGBAColor(255, 255, 255, 0.5);
    self.storeName = [[UILabel alloc] initWithFrame:CGRectMake(5 *SCALE_375, 5 *SCALE_375, centerView.width - 10 *SCALE_375, 14.5 *SCALE_375)];
    self.storeName.textColor = YFRGBColor(51, 51, 51);
    self.storeName.font = [UIFont systemFontOfSize:15.0 *SCALE_375];
    self.storeName.text = @"很坑人的店铺";
    [centerView addSubview:self.storeName];
    [self addSubview:centerView];

    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(285 *SCALE_375, self.storeIcon.y, 75 *SCALE_375, 45 *SCALE_375)];
    [self addSubview:rightView];

    UIImageView *collectImg = [[UIImageView alloc] initWithFrame:CGRectMake(5 * SCALE_375, 2.5 *SCALE_375, rightView.width - 10 *SCALE_375, 23 *SCALE_375)];
    collectImg.backgroundColor = [UIColor orangeColor];
    collectImg.image = [UIImage imageNamed:@""];
    [rightView addSubview:collectImg];

    self.collectionLbl = [[UILabel alloc] initWithFrame:CGRectMake(5 * SCALE_375, 2.5 *SCALE_375, rightView.width - 10 *SCALE_375, 23 *SCALE_375)];
    _collectionLbl.text = @"收藏";
    _collectionLbl.font = [UIFont systemFontOfSize:12 *SCALE_375];
    _collectionLbl.textAlignment = NSTextAlignmentCenter;
    _collectionLbl.textColor = [UIColor whiteColor];
    [rightView addSubview:_collectionLbl];

    self.collectionNum = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(collectImg.frame), rightView.width, 19.5*SCALE_375)];
    _collectionNum.text = @"粉丝20W";
    _collectionNum.textAlignment = NSTextAlignmentCenter;
    _collectionNum.textColor = YFRGBColor(51, 51, 51);
    _collectionNum.font = [UIFont systemFontOfSize:10.0 *SCALE_375];

    [rightView addSubview:_collectionNum];

    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
