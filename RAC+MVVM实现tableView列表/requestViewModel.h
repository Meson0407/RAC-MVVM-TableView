//
//  requestViewModel.h
//  RAC+MVVM实现tableView列表
//
//  Created by 薛涛 on 17/2/27.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "ReactiveCocoa.h"
#import "AFNetworking.h"

@interface requestViewModel : NSObject<UITableViewDataSource>

@property (nonatomic, strong, readonly) RACCommand *requesCommand;
@property (nonatomic, strong) NSArray *models;

@end
