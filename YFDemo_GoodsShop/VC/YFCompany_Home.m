//
//  YFCompany_Home.m
//  MonkeyKing
//
//  Created by 亚飞 on 2018/4/4.
//  Copyright © 2018年 paimwin123. All rights reserved.
//

#import "YFCompany_Home.h"
#import "YFGoods_TCell3.h"
@interface YFCompany_Home ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation YFCompany_Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];

}

- (void)initUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FRAME_WIDTH, FRAME_HEIGHT - self.navHeight - 50 *SCALE_375) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
//    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YFGoods_TCell3 *cell = [YFGoods_TCell3 cellWithTableView:tableView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    YFGoods_DetailVC *detailVC = [[YFGoods_DetailVC alloc] init];
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:detailVC animated:YES];
//    self.hidesBottomBarWhenPushed = NO;}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (165 + 73.5 + 15) *SCALE_375;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%lf", self.tableView.contentOffset.y);
    if (self.tableView.contentOffset.y < 0) {
        self.tableView.scrollEnabled = NO;
    }

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
