//
//  ExchangeViewController.m
//  Answer
//
//  Created by YuJie on 8/7/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "ExchangeViewController.h"
#import "ExchangeCell.h"
#import "UIColor+Hex.h"

#define Rows 3

@interface ExchangeViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, retain) UITableView *m_tableView;

@property (nonatomic, retain) NSMutableArray *data;

@end

@implementation ExchangeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"兑换";
        
        self.data = [[NSMutableArray alloc] init];
        
        NSDictionary *dic = @{@"section" : @"移动影音", @"bgColor" : @"0x0000ff", @"content" : @[@{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}]};
        
        NSDictionary *dic1 = @{@"section" : @"美妆护肤", @"bgColor" : @"0xff0000", @"content" : @[@{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}, @{@"icon":@"1", @"name":@"移动硬盘"}]};
        
        [self.data addObject:dic];
        [self.data addObject:dic1];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.m_tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    self.m_tableView.delegate=self;
    self.m_tableView.dataSource=self;
    
    self.m_tableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.m_tableView];
    // Do any additional setup after loading the view.
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    int count = [[[self.data objectAtIndex:section] objectForKey:@"content"] count];
    
    int aaaa =  count % 4 == 0 ? count / 4 : count / 4 + 1;
    NSLog(@"%d", aaaa);
    return aaaa;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    __weak ExchangeCell *cell = [tableView dequeueReusableCellWithIdentifier:
                                 SimpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ExchangeCell" owner:nil options:nil] lastObject];
    }
    
    NSArray *arr = [[self.data objectAtIndex:indexPath.section] objectForKey:@"content"];
    
    int index = 0;
    
    for (int i = indexPath.row * 4; i < indexPath.row * 4 + 4; i++) {
        if (i < arr.count - 1) {
            UILabel *label = (UILabel *)[cell.contentView viewWithTag:1001 + index];
            label.text = [[arr objectAtIndex:i] objectForKey:@"name"];
            index ++;
        }
    }
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 33)];
    view.backgroundColor = [UIColor colorWithHexString:[[self.data objectAtIndex:section] objectForKey:@"bgColor"]];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 320, 33)];
    title.backgroundColor = [UIColor clearColor];
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:13];
    title.numberOfLines = 1;
    title.text = [[self.data objectAtIndex:section] objectForKey:@"section"];
    [view addSubview:title];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 33;
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

@end
