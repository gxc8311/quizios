//
//  UIAlertView+Tip.h
//  Answer
//
//  Created by apple on 14-7-26.
//  Copyright (c) 2014年 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Tip)

+ (UIAlertView *)showMessage:(NSString *)tip;
+ (UIAlertView *)showTitle:(NSString *)title message:(NSString *)message;

@end
