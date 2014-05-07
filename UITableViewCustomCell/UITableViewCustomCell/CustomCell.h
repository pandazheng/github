//
//  CustomCell.h
//  UITableViewCustomCell
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property (nonatomic,strong) NSString *model;

+ (float) cellHeight;

@end
