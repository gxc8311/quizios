//
//  PKViewController.m
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "PKViewController.h"
#import "AMProgressView.h"
#import "QuestionOne.h"
#import "QuestionView.h"
#import "UIAlertView+Tip.h"

#define BORDER_WIDTH    3
#define ALPHA_ANI_TIME  1.0f
#define SURPLUS_TIMES   10
#define ANSWER_TAG      1000
#define PAUSE_TIME      1

@interface PKViewController ()
<
UIAlertViewDelegate
>
{
    AMProgressView *rivalPro;
    AMProgressView *mePro;
    
    UInt8 surplusTimes;
    UInt8 topicNum;
    UInt8 orgTopicNum;
    UInt8 answerCount;//计算答对的总数
}

@property (nonatomic, retain) IBOutlet UIImageView *meHead;
@property (nonatomic, retain) IBOutlet UIImageView *rivalHead;
@property (nonatomic, retain) IBOutlet UILabel *countDownLable;
@property (nonatomic, retain) IBOutlet UIView *countdownView;
@property (nonatomic, retain) IBOutlet UIView *prepareView;

@property (nonatomic, retain) NSTimer *curTimer;
@property (nonatomic, retain) NSMutableArray *answerArray;

@end

@implementation PKViewController

- (void)dealloc
{
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        surplusTimes = SURPLUS_TIMES;
        orgTopicNum = topicNum = 10;
        answerCount = 0;
        
        _answerArray = [[NSMutableArray alloc] init];
        
        for (int i = 0; i < topicNum; i++) {
            
            if (i % 2 == 0) {
                NSMutableDictionary *answerDic = [NSMutableDictionary dictionary];
                [answerDic setObject:@"xxxxxxxxxxxxxxxxxxxxxxxxxx" forKey:@"answer"];
                [answerDic setObject:@[@"A", @"B", @"C", @"D"] forKey:@"response"];
                [answerDic setObject:[NSNumber numberWithInt:2] forKey:@"index"];
                [_answerArray addObject:answerDic];
            }
            else
            {
                NSMutableDictionary *answerDic = [NSMutableDictionary dictionary];
                [answerDic setObject:@"The Logo for this company can almost always be found emblazoned on a bag of snacks." forKey:@"answer"];
                [answerDic setObject:@[@"Ruffles", @"Sun Chips", @"Lay's Potato Chilps", @"Doritos"] forKey:@"response"];
                [answerDic setObject:[NSNumber numberWithInt:1] forKey:@"index"];
                [_answerArray addObject:answerDic];
            }
        }
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = ASColor(38, 38, 38);
    
    [self ViewStrokes:self.meHead];
    [self ViewStrokes:self.rivalHead];
    [self ViewStrokes:self.countdownView];
    
    mePro = [self createProgressWithFrame:CGRectMake(10, kScreenHeight / 3 + 10, 10, kScreenHeight * 2 / 3 - 30)];
    rivalPro = [self createProgressWithFrame:CGRectMake(300, kScreenHeight / 3 + 10, 10, kScreenHeight * 2 / 3 - 30)];
    
    [self prepareAni];
}

//#param mark StartAnswer

- (void)startAnswer
{
    if (self.curTimer) {
        [self invalidateTimer];
    }
    self.curTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                     target:self
                                                   selector:@selector(updateTimes)
                                                   userInfo:nil
                                                    repeats:YES];
}

- (void)updateTimes
{
    if (surplusTimes-- == 0) {
        surplusTimes = SURPLUS_TIMES;
        [self processTopic];
    }
    
    [self updateCountDownLable];
}

- (void)updateCountDownLable
{
    [self.countDownLable setText:[NSString stringWithFormat:@"%d", surplusTimes]];
}

- (void)processTopic
{
    if (topicNum == 0) {
        [self invalidateTimer];
        UIAlertView *alertView = [UIAlertView showTitle:@"Game Over"
                                                message:[NSString stringWithFormat:@"您答对了%d道题", answerCount]];
        alertView.delegate = self;
        return;
    }
    
    [self layoutAnswerView:[_answerArray objectAtIndex:--topicNum]];
}

- (void)invalidateTimer
{
    [self.curTimer invalidate];
    self.curTimer = NULL;
}

- (void)layoutAnswerView:(NSDictionary *)dic
{
    QuestionView *questView = (QuestionView *)[self.view viewWithTag:ANSWER_TAG];
    if (questView) {
        [questView initData:dic];
    }
    else
    {
        __weak typeof(self) mySelf = self;
        
        questView = [[[UINib nibWithNibName:@"QuestionView" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
        questView.clickDelegate = ^(int tag){
            [mySelf processSelectResult:tag];
        };
        [questView layoutView];
        [questView initData:dic];
        [questView setTag:ANSWER_TAG];
        [self.view addSubview:questView];
    }
    
}

- (void)prepareAni
{
    __weak typeof(self) mySelf = self;
    
    void (^animationBlock)() = ^{
        mySelf.prepareView.alpha = 1;
    };
    
    [UIView animateWithDuration:ALPHA_ANI_TIME
                     animations:animationBlock
                     completion:^(BOOL finish){
                         [mySelf performSelector:@selector(removePrepareView)
                                      withObject:nil
                                      afterDelay:1];
                     }];
}

- (void)removePrepareView
{
    [self.prepareView removeFromSuperview];
    _prepareView = NULL;
    [self startAnswer];
    [self processTopic];
}

- (void)ViewStrokes:(UIView *)view
{
    view.layer.cornerRadius = view.frame.size.width / 2;
    view.layer.borderWidth = BORDER_WIDTH;
    view.layer.borderColor = [[UIColor whiteColor] CGColor];
    view.layer.masksToBounds = YES;
}

- (void)processSelectResult:(int)tag
{
    QuestionView *questView = (QuestionView *)[self.view viewWithTag:ANSWER_TAG];
    if ([[[self.answerArray objectAtIndex:topicNum] objectForKey:@"index"] intValue] == tag - 100) {
        [questView changeBtnColor:true andTag:tag];
        answerCount++;
        [self updateProgressView];
    }
    else
        [questView changeBtnColor:false andTag:tag];
    
    [self invalidateTimer];
    [self performSelector:@selector(goOnGame)
               withObject:nil
               afterDelay:PAUSE_TIME];
    
}

- (void)goOnGame
{
    QuestionView *questView = (QuestionView *)[self.view viewWithTag:ANSWER_TAG];
    if (questView) {
        [questView recoverView];
    }
    surplusTimes = 0;
    [self startAnswer];
    [self updateTimes];
}

- (void)updateProgressView
{
    float progress = (float)answerCount / (float)orgTopicNum;
    [mePro setProgress:progress];
}

#pragma mark --AlertDeledate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self invalidateTimer];
    [self.navigationController popViewControllerAnimated:YES];
}

- (AMProgressView *)createProgressWithFrame:(CGRect)frame
{
    AMProgressView *pro = [[AMProgressView alloc] initWithFrame:frame
                                              andGradientColors:[NSArray arrayWithObjects:
                                                                 [UIColor colorWithRed:0.0f green:0.0f blue:0.3f alpha:0.50f],
                                                                 [UIColor colorWithRed:0.3f green:0.3f blue:0.6f alpha:0.75f],
                                                                 [UIColor colorWithRed:0.6f green:0.6f blue:0.9f alpha:1.00f], nil]
                                               andOutsideBorder:NO
                                                    andVertical:YES];
    pro.emptyPartAlpha = 0.8f;
    pro.progress = 0.0;
    pro.layer.cornerRadius = pro.frame.size.width / 2;
    pro.layer.masksToBounds = YES;
    [self.view addSubview:pro];
    
    return pro;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
