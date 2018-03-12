//
//  ViewController.m
//  MJRefreshLoadingDemo
//
//  Created by 张昭 on 12/03/2018.
//  Copyright © 2018 heyfox. All rights reserved.
//

#import "ViewController.h"
#import "QXRefreshHeader.h"
#import "QXRefreshFooter.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *mTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    _mTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mTableView];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
    [_mTableView registerClass:[UITableViewCell self] forCellReuseIdentifier:@"reuse"];
    
    __weak typeof(self) weakSelf = self;
    QXRefreshHeader *header = [QXRefreshHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];
    _mTableView.mj_header = header;
    [_mTableView.mj_header beginRefreshing];
}

- (void)loadData {
    NSLog(@"加载数据");
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(doEndRefresh) object:nil];
    [self performSelector:@selector(doEndRefresh) withObject:nil afterDelay:(arc4random() % 3 + 0.1)];
}

- (void)doEndRefresh {
    /** 要显示刷新失败，则将isFail设为true */
//    ((QXPullRefreshLoadingView *)_mTableView.mj_header).isFail = true;
    
    [_mTableView.mj_header endRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row * 100];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
