//
//  Shop.m
//  TableViewOne2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Shop.h"

@implementation Shop

+ (id) shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc
{
    Shop *shop = [[Shop alloc] init];
    shop.icon = icon;
    shop.name = name;
    shop.desc = desc;
    
    return shop;
}

@end
