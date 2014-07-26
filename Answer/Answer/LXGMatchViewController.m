//
//  LXGMatchViewController.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "LXGMatchViewController.h"
#import "LXGCandidateView.h"
#import "UIViewExt.h"
#import "UIView+Label.h"

#define FONT_SIZE 14.f

@interface LXGMatchViewController ()
{
    LXGCandidateView *candidateView;
}

@end

@implementation LXGMatchViewController

- (void)dealloc
{
    [candidateView destroyCandidateTimer];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Matching";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    candidateView = [[LXGCandidateView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 200, kScreenWidth, PEOPLE_HEIGHT)];
    
    __weak typeof(self) safeSelf = self;
   
    candidateView.successDelegate = ^(void){
        safeSelf.matchDelegate();
    };
    
    [self.view addSubview:candidateView];
    
    UILabel *topLabel = [self.view showLabelWithFrame:CGRectMake(0,
                                                                 candidateView.bottom + 10,
                                                                 kScreenWidth,
                                                                 FONT_SIZE)
                                             fontsize:FONT_SIZE
                                                 text:@"Opponent is preparing for matchup!"];
    [topLabel setTextColor:[UIColor whiteColor]];
    
    UIImage *norBtn = [UIImage imageNamed:MATCH_CANCEL_BTN];
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setBackgroundImage:norBtn forState:UIControlStateNormal];
    [cancelBtn setFrame:CGRectMake((kScreenWidth - norBtn.size.width / 2) / 2, topLabel.bottom + 10, norBtn.size.width / 2, norBtn.size.height / 2)];
    [cancelBtn setTitle:@"cancel" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [cancelBtn addTarget:self action:@selector(cancelMatch) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    // Do any additional setup after loading the view.
}

- (void)cancelMatch
{
    [self.navigationController popViewControllerAnimated:true];
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
