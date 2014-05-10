//
//  main.m
//  CommandDemo
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int i = 100;
        NSLog(@"%i",i);
        
        NSString *str = @"Hello World";
        NSLog(@"%@",str);
        
        NSLog(@"Hello, World!");
        
        
        NSString *str1 = @"test";
        NSString *str2 = @"test";
        if ([str1 isEqualToString:str2])
        {
            NSLog(@"两个字符串相等");
        }
    }
    return 0;
}

