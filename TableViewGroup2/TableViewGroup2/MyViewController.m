//
//  MyViewController.m
//  TableViewGroup2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

//字典中用到的key
#define kHeader @"header"   //头部标题对应的key
#define kFooter @"footer"   //尾部标题对应的key
#define kCities @"cities"   //城市数组对应的key

@interface MyViewController ()
{
    NSArray *_allProvinces;         //所有省份
}

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
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    //初始化数据
    _allProvinces = @[
                      
                      @{
                          kHeader : @"广东",
                          kFooter : @"广东好",
                          kCities : @[@"广州", @"深圳", @"梅州"]
                          },
                      
                      @{
                          kHeader : @"湖南",
                          kFooter : @"湖南也好",
                          kCities : @[@"长沙", @"益阳"]
                          },
                      
                      @{
                          kHeader : @"湖北",
                          kFooter : @"湖北更好",
                          kCities : @[@"武汉", @"黄冈"]
                          }
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

#pragma mark ----数据源方法
#pragma mark ----一共有多少组
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return _allProvinces.count;
}

#pragma mark -----第section组一共有多少行
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取得第section组的省份
    NSDictionary *province = _allProvinces[section];
    
    //取得省份里面的城市数组
    NSArray *cities = province[kCities];
    
    return cities.count;
}

#pragma mark ---返回每一行显示的内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //取出第section数组第row行的文字数据
    //取出第section组的省份中城市数组里面第row行的数据
    NSDictionary *province = _allProvinces[indexPath.section];
    NSArray *cities = province[kCities];
    
    NSString *text = cities[indexPath.row];
    
    //展示文字数据
    cell.textLabel.text = text;
    return cell;
}

#pragma mark --第section组显示的头部标题
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *province = _allProvinces[section];
    
    return province[kHeader];
}

#pragma mark --第section显示的尾部标题
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return _allProvinces[section][kFooter];
}

@end
