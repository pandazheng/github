//
//  MyViewController.h
//  TableViewGroup3
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_allProvinces;     //所有省份
}

@end
