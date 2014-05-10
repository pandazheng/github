//
//  MyViewController.h
//  TableViewGroup
//
//  Created by panda zheng on 14-5-9.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_gdCities;
    NSArray *_hnCities;
    NSArray *_hbCities;
}

@end
