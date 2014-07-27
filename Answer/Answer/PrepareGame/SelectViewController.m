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

@interface SelectViewController ()

- (IBAction)enterGame;

@end

@implementation SelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Select";
        // Custom initialization
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
    // Do any additional setup after loading the view from its nib.
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