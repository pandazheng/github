//
//  MyViewController.h
//  TableViewOne2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_shops;
}

@property (nonatomic,strong) UITableView *tableView;

@end
