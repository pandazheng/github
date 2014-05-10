//
//  Province.m
//  TableViewGroup3
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (id) provinceWithHeader:(NSString *)header footer:(NSString *)footer cities:(NSArray *)cities
{
    Province *p = [[Province alloc] init];
    p.header = header;
    p.footer = footer;
    p.citites = cities;
    
    return p;
}

@end
