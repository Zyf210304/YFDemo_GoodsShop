//
//  YFStore_SectionView.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/4.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFStore_SectionView.h"

@interface YFStore_SectionView()

@property(nonatomic,weak)UIView *indicatorView;

@end

@implementation YFStore_SectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    CGFloat pic_width = 20 *SCALE_375;
    CGFloat view_width = FRAME_WIDTH / 4;
    CGFloat view_heigh = 48 *SCALE_375;

    // 底部红色指示器
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = YFRGBColor(203, 27, 29);
    indicatorView.height = 2 *SCALE_375;
    indicatorView.tag = -1;
    indicatorView.y = self.height - indicatorView.height;
    self.indicatorView = indicatorView;

    NSArray *titleArr = @[@"首页", @"全部商品", @"公司动态", @"公司介绍"];
    NSArray *colorArr = @[(id)YFRGBColor(224, 226, 228), (id)[UIColor blackColor], (id)[UIColor orangeColor], (id)[UIColor lightGrayColor]];
    for (int i = 0; i < 4; i ++) {
        UIView *typeView =  [[UIView alloc] initWithFrame:CGRectMake(view_width * i , 0, view_width, view_heigh)];
        typeView.tag = 200 + i;
        [self addSubview:typeView];

        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake((view_width - pic_width) / 2, 5 *SCALE_375, 20 *SCALE_375, 20 *SCALE_375)];
        img.backgroundColor = colorArr[i];
        img.image = [UIImage imageNamed:@""];
        img.tag = 300 + i;
        [typeView addSubview:img];

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(img.frame)+ 5*SCALE_375, view_width, 11.5 *SCALE_375)];
        title.font = [UIFont systemFontOfSize:12.0 *SCALE_375];
        title.textColor = YFRGBColor(51, 51, 51);
        title.text = titleArr[i];
        title.tag = 400 + i;
        title.textAlignment = NSTextAlignmentCenter;
        [typeView addSubview:title];

        [self addSubview:typeView];

        if(i == 0) {
            title.textColor = YFRGBColor(203, 27, 29);

            self.indicatorView.width = [title getWidth];
            self.indicatorView.centerX = typeView.centerX;
        }

        UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(typeDidSelect:)];
        [typeView addGestureRecognizer:tapG];
    }

    [self addSubview:self.indicatorView];

}

- (void)typeDidSelect:(UITapGestureRecognizer *)sender {
    [self changeStateWith:sender.view.tag - 200];
}

- (void)changeStateWith:(NSInteger )index {
    for (int i = 0; i < 4; i++) {
        UILabel *lbl = [self viewWithTag:400 + i];
        lbl.textColor = YFRGBColor(51, 51, 51);
    }

    UILabel *selectLbl = [self viewWithTag:400 + index];
    selectLbl.textColor = YFRGBColor(203, 27, 29);
    UIView *typeView = [self viewWithTag:200 + index];
    // 让标签执行动画
    [UIView animateWithDuration:.025 animations:^{
        self.indicatorView.width = selectLbl.getWidth;
        self.indicatorView.centerX = typeView.centerX;
    }];

    self.typeDidChoose(index);
}

@end
