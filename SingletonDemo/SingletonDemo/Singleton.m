//
//  Singleton.m
//  SingletonDemo
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Singleton.h"

static id instance = nil;

@implementation Singleton

+ (id) instance
{
    if (!instance)
    {
        instance = [[super alloc] init];
    }
    
    return instance;
}

@end
