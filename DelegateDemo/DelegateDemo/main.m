//
//  main.m
//  DelegateDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Baby *b = [[Baby alloc] init];
        b.age = 1;
        
        b.baomu = [[Dog alloc] init];
        
        [b cry];
    }
    return 0;
}

