//
//  requestViewModel.m
//  RAC+MVVM实现tableView列表
//
//  Created by 薛涛 on 17/2/27.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "requestViewModel.h"

@implementation requestViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initBind];
    }
    return self;
}

- (void)initBind {
    //RACCommand 用于表示事件的执行
    _requesCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        // 创建信号
        RACSignal *requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSDictionary *parameters = @{@"q":@"基础"};
            [[AFHTTPRequestOperationManager manager] GET:@"https://api.douban.com/v2/book/search" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                // 发出信号
                [subscriber sendNext:responseObject];
                // 数据传输完毕 必须调用完成 否则命令永远处于执行状态
                [subscriber sendCompleted];
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
            }];
            return nil;
        }];
        
        return [requestSignal map:^id(id value) {
            NSMutableArray *dictArr = value[@"books"];
            NSArray *modelArr = [[dictArr.rac_sequence map:^id(id value) {
                return [Book bookWithDic:value];
            }] array];
            return modelArr;
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    Book *book = self.models[indexPath.row];
    cell.detailTextLabel.text = book.subtitle;
    cell.textLabel.text = book.title;
    return cell;
}

@end
