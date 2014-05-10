//
//  Nurse.h
//  DelegateDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Baby;

@interface Nurse : NSObject

- (void) babyCry: (Baby *) baby;
- (void) babySleep: (Baby *) baby;
- (void) babyHungry: (Baby *) baby;

@end
