//
//  LXGCandidateView.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "LXGCandidateView.h"

#define displacement    45
#define MOVE_TIME       1.0f
#define WAIT_TIME       0.3f

@interface LXGCandidateView ()
{
    NSArray     *namesArray;
    UIImageView *peopleView;
    UIImageView *customView;
    UInt8       index;
    
    NSTimer     *mTimer;
}

@end

@implementation LXGCandidateView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        index = 0;
        
        namesArray = [[NSArray alloc] initWithObjects:CAT_NAME, DOG_NAME, GHOST_NAME, GORILLA_NAME, NINJA_NAME, OWL_NAME, PANDA_NAME, PIG_NAME, SKULL_NAME, SNAKE_NAME, nil];
        
        UIImage *peopleImg = [UIImage imageNamed:CANDIDATE_NAME];
        peopleView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                   (frame.size.height - peopleImg.size.height / 2.0) / 2,
                                                                   peopleImg.size.width / 2.0,
                                                                   peopleImg.size.height / 2.0)];
        peopleView.image = peopleImg;
        
        [self addSubview:peopleView];
        
        customView = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - PEOPLE_HEIGHT) / 2,
                                                                   0,
                                                                   PEOPLE_HEIGHT,
                                                                   PEOPLE_HEIGHT)];
        customView.image = [UIImage imageNamed:[namesArray objectAtIndex:index]];
        customView.layer.cornerRadius = PEOPLE_HEIGHT / 2;
        customView.layer.borderWidth = 5;
        customView.layer.borderColor = [[UIColor whiteColor] CGColor];
        customView.layer.masksToBounds = YES;
        [self addSubview:customView];
        
        [self start];
        mTimer = [NSTimer scheduledTimerWithTimeInterval:MOVE_TIME + WAIT_TIME target:self selector:@selector(start) userInfo:nil repeats:YES];
        // Initialization code
    }
    return self;
}

- (void)start
{
//    [self destroyTimer];
//    if (self.successDelegate) {
//        self.successDelegate();
//    }
    
    if (index >= [namesArray count] - 1) {
        [self destroyTimer];
        if (self.successDelegate) {
            self.successDelegate();
        }
        return;
    }
    index++;
    
    void (^animationBlock)() = ^{
        peopleView.left = -displacement;
    };
    
    [UIView animateWithDuration:MOVE_TIME
                     animations:animationBlock
                     completion:^(BOOL finish){
                                customView.image = [UIImage imageNamed:[namesArray objectAtIndex:index]];
                                peopleView.left = 0;
    }];
}

- (void)destroyCandidateTimer
{
    [self destroyTimer];
}

- (void)destroyTimer
{
    if (mTimer) {
        [mTimer invalidate];
        mTimer = NULL;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
