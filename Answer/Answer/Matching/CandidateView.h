//
//  LXGCandidateView.h
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PEOPLE_HEIGHT   100

@interface CandidateView : UIView

@property (nonatomic, copy) void (^successDelegate)(void);

- (void)destroyCandidateTimer;

@end
