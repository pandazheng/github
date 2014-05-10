//
//  MyViewController.m
//  TableViewGroup
//
//  Created by panda zheng on 14-5-9.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    _gdCities = @[@"广州",@"深圳",@"梅州"];
    _hnCities = @[@"长沙",@"益阳"];
    _hbCities = @[@"武汉",@"黄岗"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark ------
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return _gdCities.count;
    }
    else if(section == 1)
    {
        return _hnCities.count;
    }
    else
    {
        return _hbCities.count;
    }
}

#pragma mark --------
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *text = nil;
    
    if (indexPath.section == 0)
    {
        text = _gdCities[indexPath.row];
    }
    else if (indexPath.section == 1)
    {
        text = _hnCities[indexPath.row];
    }
    else
    {
        text = _hbCities[indexPath.row];
    }
    
    cell.textLabel.text = text;
    return cell;
}

@end
