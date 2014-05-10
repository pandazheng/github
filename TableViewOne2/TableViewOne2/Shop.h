//
//  Shop.h
//  TableViewOne2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

//图片
@property (nonatomic,copy) NSString *icon;

//名称
@property (nonatomic,copy) NSString *name;

//描述
@property (nonatomic,copy) NSString *desc;

+ (id) shopWithName: (NSString *) name icon: (NSString *) icon desc: (NSString *) desc;

@end
