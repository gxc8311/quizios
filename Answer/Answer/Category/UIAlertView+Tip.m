//
//  UIAlertView+Tip.m
//  Answer
//
//  Created by apple on 14-7-26.
//  Copyright (c) 2014年 Liuxiaoguang. All rights reserved.
//

#import "UIAlertView+Tip.h"

@implementation UIAlertView (Tip)

+ (UIAlertView *)title:(NSString *)_title
               message:(NSString *)_message
              delegate:(id)_delegate
        cancelBtnTitle:(NSString *)_cancelTitle
        otherBtnTitles:(NSString *)_otherBtnTitle
{
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:_title
                                                        message:_message
                                                       delegate:_delegate
                                              cancelButtonTitle:_cancelTitle
                                              otherButtonTitles:_otherBtnTitle,
                              nil];
    [alertView show];
    
    return alertView;
}

+ (UIAlertView *)showMessage:(NSString *)tip
{
    return [UIAlertView showTitle:nil
                          message:tip];
}

+ (UIAlertView *)showTitle:(NSString *)title
                   message:(NSString *)message
{
    return [UIAlertView title:title
                      message:message
                     delegate:nil
               cancelBtnTitle:@"Confirm"
               otherBtnTitles:nil];
}

@end
