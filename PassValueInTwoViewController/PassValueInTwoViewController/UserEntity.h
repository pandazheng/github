//
//  UserEntity.h
//  PassValueInTwoViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserEntity : NSObject
{
    NSString *userName;
    NSString *gendar;
    int age;
}

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *gendar;
@property (nonatomic,assign) int age;

@end
