//
//  main.m
//  SingletonDemo
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSLog(@"%d",[Singleton instance] == [Singleton instance]);
    }
    return 0;
}

