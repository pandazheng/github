//
//  Baby.h
//  DelegateDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BabyBaomuXieyi.h"

@interface Baby : NSObject

@property (nonatomic,strong) id<BabyBaomuXieyi> baomu;
@property (nonatomic,assign) int age;

- (void) hungry;
- (void) cry;
- (void) sleep;

@end
