//
//  Book.m
//  RAC+MVVM实现tableView列表
//
//  Created by 薛涛 on 17/2/27.
//  Copyright © 2017年 Xuetao. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (Book *)bookWithDic:(NSDictionary *)dict {
    return [[Book alloc] initWithDic:dict];
}

- (id)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
