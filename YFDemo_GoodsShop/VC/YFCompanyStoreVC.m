//
//  YFCompanyStoreVC.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/4.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFCompanyStoreVC.h"
//#import "YFSearchBack_Nav.h"
#import "YFStore_header.h"
#import "YFStore_SectionView.h"

#import "YFCompany_Home.h"
#import "YFCompany_AllGoods.h"
#import "YFCompany_Dynamic.h"
#import "YFCompany_Content.h"



@interface YFCompanyStoreVC ()<UIScrollViewDelegate>

//@property (nonatomic, strong) YFSearchBack_Nav *backNAV;

@property (nonatomic, strong) YFStore_header *headerView;
@property (nonatomic, strong) YFStore_SectionView *TypeView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIScrollView *contentView;


@property (nonatomic, strong) YFCompany_Home *homeVC;
@end

@implementation YFCompanyStoreVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addChildVCs];
    [self initUI];
    [self setupContentView];
}

- (void)addChildVCs {
    self.homeVC = [[YFCompany_Home alloc] init];
    [self addChildViewController:self.homeVC];

    YFCompany_AllGoods *goodsVC = [[YFCompany_AllGoods alloc] init];
    [self addChildViewController:goodsVC];

    YFCompany_Dynamic *dynamic = [[YFCompany_Dynamic alloc] init];
    [self addChildViewController:dynamic];

    YFCompany_Content *content = [[YFCompany_Content alloc] init];
    [self addChildViewController:content];
}

- (void)initUI {
    self.scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(FRAME_WIDTH, FRAME_WIDTH / 375 * 188 + FRAME_HEIGHT - self.navHeight);
    [self.view addSubview:self.scrollView];
    self.headerView = [[YFStore_header alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_WIDTH / 375 * 188)];
    [self.scrollView addSubview:self.headerView];

    self.TypeView = [[YFStore_SectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerView.frame), FRAME_WIDTH, 50 *SCALE_375)];
    WeakSelf
    self.TypeView.typeDidChoose = ^(NSInteger index) {
        CGPoint offset = weakSelf.contentView.contentOffset;
        offset.x = index * self.contentView.width;
        [weakSelf.contentView setContentOffset:offset animated:YES];
    };
    [self.scrollView addSubview:self.TypeView];




//    self.backNAV = [[YFSearchBack_Nav alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, self.navHeight)];
//
//    self.backNAV.backBlock = ^{
//        [weakSelf.navigationController popViewControllerAnimated:YES];
//    };
//    [self.view addSubview:self.backNAV];

}

- (void)setupContentView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = CGRectMake(0, CGRectGetMaxY(self.TypeView.frame), FRAME_WIDTH, FRAME_HEIGHT);
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    [self.scrollView insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    self.contentView = contentView;

    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];

}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        CGFloat offsetY = self.scrollView.contentOffset.y;
        NSLog(@"%++lf", self.scrollView.contentOffset.y);
        if (offsetY > self.headerView.height - self.navHeight) {
//            self.scrollView.contentOffset = CGPointMake(0, self.headerView.height);
            [scrollView setContentOffset:CGPointMake(0,self.headerView.height - self.navHeight) animated:NO];
            self.homeVC.tableView.scrollEnabled  = YES;
        } else {
            self.homeVC.tableView.scrollEnabled  = NO;
        }
    }
}
/**
 *  滚动完毕就会调用（如果不是人为拖拽scrollView导致滚动完毕，才会调用这个方法
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.contentView]) {
        // 当前的索引
        NSInteger index = scrollView.contentOffset.x / scrollView.width;

        // 取出子控制器
        UIViewController *vc = self.childViewControllers[index];
        vc.view.x = scrollView.contentOffset.x;
        vc.view.y = 0; //设置控制器view的y值为0（默认是20）
        vc.view.height = scrollView.height; //设置控制器view的height值为整个屏幕的高度（默认是比屏幕高度少20）

        [scrollView addSubview:vc.view];
    }

}
/**
 *  在scrollview停止滑动的时候执行
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.contentView]) {
        [self scrollViewDidEndScrollingAnimation:scrollView];
        // 点击菜单按钮
        NSInteger index = scrollView.contentOffset.x / scrollView.width;
        [self.TypeView changeStateWith:index];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
