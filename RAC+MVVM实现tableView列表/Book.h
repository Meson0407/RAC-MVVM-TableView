//
//  Book.h
//  RAC+MVVM实现tableView列表
//
//  Created by 薛涛 on 17/2/27.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

+ (Book *)bookWithDic:(NSDictionary *)dict;

@end
