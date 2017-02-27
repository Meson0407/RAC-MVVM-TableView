//
//  ViewController.m
//  RAC+MVVM实现tableView列表
//
//  Created by 薛涛 on 17/2/27.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "ViewController.h"
#import "requestViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) requestViewModel *requesViewModel;

@end

@implementation ViewController

- (requestViewModel *)requesViewModel {
    if (_requesViewModel == nil) {
        _requesViewModel = [[requestViewModel alloc] init];
    }
    return _requesViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self.requesViewModel;
    [self.view addSubview:tableView];
    
    RACSignal *signal = [self.requesViewModel.requesCommand execute:nil];
    // 订阅信号
    [signal subscribeNext:^(id x) {
        self.requesViewModel.models = x;
        [tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
