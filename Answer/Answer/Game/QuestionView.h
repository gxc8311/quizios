//
//  LXGQuestionView.h
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionView : UIView

@property (nonatomic, copy) void (^clickDelegate)(NSInteger tag);

- (void)changeBtnColor:(BOOL)value andTag:(NSInteger)tag;
- (void)recoverView;
- (void)layoutView;
- (void)initData:(NSDictionary *)dic;

@end
