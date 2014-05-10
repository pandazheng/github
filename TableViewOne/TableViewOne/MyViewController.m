//
//  MyViewController.m
//  TableViewOne
//
//  Created by panda zheng on 14-5-10.
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
#pragma mark --一共一组
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark --这一组里面有多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

#pragma mark --返回第indexPath这行对应的内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     Default : 不显示detailTextLabel
     Value1 : 在右边显示detailTextLabel
     Value2 : 不显示图片，显示detailTextLabel
     Subtitle : 在底部显示detailTextLabel
     */
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = [NSString stringWithFormat:@"严品-%d",indexPath.row];
    
    //设置详情文字
    cell.detailTextLabel.text = [NSString stringWithFormat:@"严品-%d非常好",indexPath.row];
    
    //设置图片
    NSString *imageName = [NSString stringWithFormat:@"00%d.png",indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    // 设置最右边的小图标
    //    if (indexPath.row % 2 == 0) {
    //        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //    } else {
    //        cell.accessoryType = UITableViewCellAccessoryNone;
    //    }
    
    // 设置最右边的显示什么控件
    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    return cell;
}

#pragma mark ---代理方法
#pragma mark ---返回indexPath这行cell的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

@end
