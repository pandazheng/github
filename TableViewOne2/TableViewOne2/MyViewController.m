//
//  MyViewController.m
//  TableViewOne2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"
#import "Shop.h"

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
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // 创建数组
    _shops = [NSMutableArray array];
    
    // 创建数据
    Shop *shop1 = [Shop shopWithName:@"图书/音像" icon:@"001.png" desc:@"小说，情感，卡拉OK"];
    
    Shop *shop2 = [Shop shopWithName:@"母婴用品" icon:@"002.png" desc:@"防尿，奶粉，喂养"];
    
    Shop *shop3 = [Shop shopWithName:@"玩具" icon:@"003.png" desc:@"卡车，积木，鸡毛"];
    
    [_shops addObjectsFromArray:@[shop1, shop2, shop3]];
    
    // 添加其他假数据
    //    for (int i = 0; i<20; i++) {
    //        NSString *name = [NSString stringWithFormat:@"随机产品-%d", i];
    //        NSString *desc = [NSString stringWithFormat:@"%@ - 好好好", name];
    //        NSString *icon = [NSString stringWithFormat:@"00%d.png", (i % 9) + 1];
    //        Shop *shop = [Shop shopWithName:name icon:icon desc:desc];
    //
    //        [_shops addObject:shop];
    //    }
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
    NSLog(@"numberOfRows-----");
    return _shops.count;
}

#pragma mark --返回第indexPath这行对应的内容
- (UITableViewCell *) tableView: (UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRow----%d",indexPath.row);
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    //取出这行对应的商品
    Shop *shop = _shops[indexPath.row];
    
    //商品名称
    cell.textLabel.text = shop.name;
    
    //商品的描述
    cell.detailTextLabel.text = shop.desc;
    
    //商品的图片
    cell.imageView.image = [UIImage imageNamed:shop.icon];
    
    //右边的箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark --代理方法
#pragma mark --返回indexPath这行cell的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark --选中了某一行的cell就会调用
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出所点击这行的商品对象
    Shop *shop = _shops[indexPath.row];
    
    //创建弹框
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"商品信息展示" message:nil  delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //设置样式
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    //设置文本框的默认文字
    [alert textFieldAtIndex:0].text = shop.name;
    
    //显示弹框
    [alert show];
    
    //绑定行号为 alertview的tag
    alert.tag = indexPath.row;
}

#pragma mark - alertview的代理方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) return;
    
    // 1.取出文本框的文字
    NSString *text = [alertView textFieldAtIndex:0].text;
    
    // 2.将文字更新到对应的cell上面去
    
    // 2.1.修改对应位置的模型数据
    int row = alertView.tag; // alertView的tag就是行号
    Shop *shop = _shops[row];
    shop.name = text;
    
    // 2.2.刷新表格
    //    [_tableView reloadData]; // 整体刷新（每一行都会刷新）
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    
    NSArray *paths = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:UITableViewRowAnimationLeft];
    
    /*
     重新向数据源索取数据
     重新向数据源发送消息
     重新调用数据源的方法，根据返回值决定显示什么数据
     */
    
    
    //    if (buttonIndex == 1) {
    //        
    //    }
}

@end
