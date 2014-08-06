//
//  LXGSelectViewController.m
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "SelectViewController.h"
#import "MatchViewController.h"
#import "PKViewController.h"
#import "SelectTableViewCell.h"

#define Rows 3

@interface SelectViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, retain) NSMutableArray *statusArray;
@property (nonatomic, retain) UITableView *m_tableView;
@property (nonatomic, retain) SelectTableViewCell *aniCell;

- (IBAction)enterGame;

@end

@implementation SelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"主页";
        self.aniCell = NULL;
        self.statusArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < Rows; i++) {
            [self.statusArray addObject:[NSNumber numberWithBool:false]];
        }

    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationItem.hidesBackButton =YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.m_tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, kX, kScreenWidth, kSurplusHeight) style:UITableViewStylePlain];
    self.m_tableView.delegate=self;
    self.m_tableView.dataSource=self;
    self.m_tableView.separatorStyle = NO;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 45)];
    label.text = @"游戏";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    
    self.m_tableView.tableHeaderView = label;
    
    self.m_tableView.backgroundColor = ASColor(248, 178, 23);

    [self.view addSubview:self.m_tableView];
    
    self.navigationItem.leftBarButtonItem = [self setNavBtnWithName:SET_BTN selecter:@selector(leftNavBtnAction)];
    self.navigationItem.rightBarButtonItem = [self setNavBtnWithName:EXCHANGE_BTN selecter:@selector(rightNavBtnAction)];
}

- (void)leftNavBtnAction
{
    
}

- (void)rightNavBtnAction
{
    
}

- (UIBarButtonItem *)setNavBtnWithName:(NSString *)name selecter:(SEL)sel
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *image = IMGAE_NAME(name);
    
    [button setBackgroundImage:image
                      forState:UIControlStateNormal];
    [button addTarget:self action:sel
     forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, image.size.width / 2, image.size.height / 2);
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark -- UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    __weak SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"SelectTableViewCell" owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        [cell.bgView.layer setCornerRadius:8];

        __weak typeof(self) mySelf = self;
        
        cell.clickDelegate = ^{
            
            NSIndexPath *indexPath = [tableView indexPathForCell:cell];
            [mySelf.statusArray removeObjectAtIndex:indexPath.row];
            [mySelf.statusArray insertObject:[NSNumber numberWithBool:true] atIndex:indexPath.row];

            if (mySelf.aniCell) {
                NSIndexPath *indexPath = [tableView indexPathForCell:mySelf.aniCell];
                [mySelf.statusArray removeObjectAtIndex:indexPath.row];
                [mySelf.statusArray insertObject:[NSNumber numberWithBool:false] atIndex:indexPath.row];
                if (mySelf.aniCell != cell) {
                    [mySelf.aniCell hideDetailView];
                    mySelf.aniCell = cell;
                }
                else
                    mySelf.aniCell = NULL;
            }
            else if (!mySelf.aniCell || mySelf.aniCell != cell) {
                mySelf.aniCell = cell;
            }
            
            [tableView reloadRowsAtIndexPaths:nil withRowAnimation:UITableViewRowAnimationNone];
        };
    }
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[self.statusArray objectAtIndex:indexPath.row] boolValue]) {
        return 165;
    }
    else
        return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 20)];
    return view;
}

- (IBAction)enterGame
{
    MatchViewController *regVC = [[MatchViewController alloc] initWithNibName:nil
                                                                             bundle:nil];
    
    __weak typeof(self) mySelf = self;
    
    regVC.matchDelegate = ^{
        [mySelf.navigationController popViewControllerAnimated:NO];
        [mySelf startGame];
    };
    [self.navigationController pushViewController:regVC animated:YES];
}

- (void)startGame
{
    [self.navigationController setNavigationBarHidden:YES];
    PKViewController *regVC = [[PKViewController alloc] initWithNibName:nil
                                                                       bundle:nil];
    [self.navigationController pushViewController:regVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
