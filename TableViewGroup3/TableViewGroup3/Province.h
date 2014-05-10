//
//  Province.h
//  TableViewGroup3
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

//UI控制用weak,NSString用copy,其他对象一般用strong
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,strong) NSArray *citites;

+ (id) provinceWithHeader: (NSString *) header footer: (NSString *) footer cities: (NSArray *) cities;

@end
