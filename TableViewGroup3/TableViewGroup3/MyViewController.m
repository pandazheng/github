//
//  MyViewController.m
//  TableViewGroup3
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"
#import "Province.h"

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
    
    //添加tableview
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    //初始化数据
//    Province *gd = [Province provinceWithHeader:@"广东" footer:@"广东好" cities:@[@"广州", @"深圳"]];
//    Province *hn = [Province provinceWithHeader:@"湖南" footer:@"湖南也好" cities:@[@"长沙"]];
    
//    _allProvinces = @[gd,hn];
    _allProvinces = @[
                      [Province provinceWithHeader:@"广东" footer:@"广东好" cities:@[@"广州", @"深圳"]],
                      
                      [Province provinceWithHeader:@"湖南" footer:@"湖南也好" cities:@[@"长沙"]],
                      
                      [Province provinceWithHeader:@"广东2" footer:@"广东好" cities:@[@"广州", @"深圳"]],
                      
                      [Province provinceWithHeader:@"湖南2" footer:@"湖南也好" cities:@[@"长沙"]]
                      ];
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

#pragma mark ---数据源方法
#pragma mark ---一共多少组
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allProvinces.count;
}

#pragma mark ---第section组一共多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取得第section组的省份
    Province *province = _allProvinces[section];
    
    //取得省份里的城市数组
    return province.citites.count;
}

#pragma mark ---返回每一行显示的内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    Province *province = _allProvinces[indexPath.section];
    
    //显示文字数据
    cell.textLabel.text = province.citites[indexPath.row];
    
    return cell;
}

#pragma mark ---第section组显示的头部标题
//- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    Province *province = _allProvinces[section];
//
//    return [province header];
//}

#pragma mark ---第section组显示的尾部标题
//- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return [_allProvinces[section] footer];
//}

#pragma mark ---返回表格右边的显示的索引条
- (NSArray *) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSMutableArray *titles = [NSMutableArray array];
    
    for (Province *p in _allProvinces)
    {
        [titles addObject:p.header];
    }
    
    return titles;
}

@end
