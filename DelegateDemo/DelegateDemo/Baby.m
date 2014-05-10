//
//  Baby.m
//  DelegateDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Baby.h"

@implementation Baby
@synthesize age = _age;

- (void) cry
{
    NSLog(@"%d岁的baby哭了",_age);
    
    [_baomu babyCry:self];
}

- (void) sleep
{
    NSLog(@"%d岁的baby想睡觉",_age);
    
    [_baomu babySleep:self];
}

- (void) hungry
{
    NSLog(@"%d岁的baby想吃东西",_age);
    
    [_baomu babyHungry:self];
}

@end
