//
//  main.m
//  FoundationDemo
//
//  Created by panda zheng on 14-5-9.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //数组
        NSArray *array = [[NSArray alloc] initWithObjects:@"a",@"b",@"c", nil];
        NSUInteger length = [array count];
        for (int i = 0 ; i < length ; i++)
        {
            NSString *element = [array objectAtIndex:i];
            NSLog(@"%@",element);
        }
        
        for (NSString *str in array)
        {
            NSLog(@"%@",str);
        }
        
        NSLog(@"%@",[array firstObject]);
        NSLog(@"%@",[array lastObject]);
    }
    return 0;
}

