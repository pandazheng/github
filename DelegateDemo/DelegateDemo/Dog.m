//
//  Dog.m
//  DelegateDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "Dog.h"
#import "Baby.h"

@implementation Dog

- (void) babyCry:(Baby *)baby
{
    NSLog(@"狗正在安慰%d岁的baby",baby.age);
}

- (void) babyHungry:(Baby *)baby
{
    NSLog(@"狗喂%d岁的baby吃东西",baby.age);
}

- (void) babySleep:(Baby *)baby
{
    NSLog(@"狗哄%d岁的baby去睡觉",baby.age);
}

@end
