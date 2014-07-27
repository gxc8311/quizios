//
//  LXGQuestionView.h
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXGQuestionView : UIView

@property (nonatomic, copy) void (^clickDelegate)(int tag);

- (void)changeBtnColor:(BOOL)value andTag:(int)tag;
- (void)recoverView;
- (void)layoutView;
- (void)initData:(NSDictionary *)dic;

@end
