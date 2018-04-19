//
//  YFGoods_TCell3.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/8.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFGoods_TCell3.h"

@implementation YFGoods_TCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    YFGoods_TCell3 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell =  [[ YFGoods_TCell3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = YFRGBColor(224, 226, 228);
        [cell initUI];
    }
    return cell;
}

- (void)initUI {
    CGFloat cell_width = 165 *SCALE_375;
    CGFloat cell_heigh = (165 + 73.5) *SCALE_375;
    for (int i = 0; i < 2; i++) {
        UIView *cellView = [[UIView alloc] initWithFrame:CGRectMake(15 *SCALE_375 + 180 *SCALE_375 * i, 0, cell_width, cell_heigh)];
        cellView.backgroundColor = [UIColor whiteColor];
        cellView.tag = 200 + i;
        [self addSubview:cellView];

        UIImageView *goodsImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell_width, cell_width)];
        goodsImg.tag = 300 + i;
        goodsImg.backgroundColor = [UIColor lightGrayColor];
        [cellView addSubview:goodsImg];

        UILabel *goodsTitle = [[UILabel alloc] initWithFrame:CGRectMake(7 *SCALE_375, CGRectGetMaxY(goodsImg.frame), cell_width - 14 *SCALE_375, 40 *SCALE_375)];
        goodsTitle.tag = 400 + i;
        goodsTitle.font = [UIFont systemFontOfSize:12.0 *SCALE_375];
        goodsTitle.numberOfLines = 2;
        goodsTitle.text = @"欧美女装2018春装新款大码宽松遮肉小立领长袖...";
        goodsTitle.textColor = YFRGBColor(102, 102, 102);
        [cellView addSubview:goodsTitle];

        UILabel *goods_price = [[UILabel alloc] initWithFrame:CGRectMake(7 *SCALE_375, cellView.height - (7.5 + 14) *SCALE_375, goodsTitle.width, 14 *SCALE_375)];
        goods_price.text = @"￥888.00";
        goods_price.font = [UIFont systemFontOfSize:14.0 *SCALE_375];
        goods_price.tag = 500 + i;
        goods_price.textColor = YFRGBColor(248, 17, 17);
        [cellView addSubview:goods_price];

        UILabel *goods_sell = [[UILabel alloc] initWithFrame:CGRectMake(7 *SCALE_375, cellView.height - (7.5 + 9) *SCALE_375, goodsTitle.width, 9 *SCALE_375)];
        goods_sell.font = [UIFont systemFontOfSize:9.0 *SCALE_375];
        goods_sell.text = @"已出售:200件";
        goods_sell.tag = 600 + i;
        goods_sell.textColor = YFRGBColor(153, 153, 153);
        goods_sell.textAlignment = NSTextAlignmentRight;
        [cellView addSubview:goods_sell];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
