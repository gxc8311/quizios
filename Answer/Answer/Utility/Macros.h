//
//  Macros.h
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#define APPDELEGATE ((AppDelegate *)[UIApplication sharedApplication].delegate)

//系统信息
#define SYSTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]
#define IS_SYSTEM_VERSION_7_GREATER (SYSTEM_VERSION >= 7.0 ? YES : NO)

//各种FRAME
#define kScreen [UIScreen mainScreen].bounds
#define kScreenHeight kScreen.size.height
#define kScreenWidth kScreen.size.width

#define kStatusHeight 20
#define kNavgationBarHeight 44
#define kSurplusHeight (kScreenHeight - kStatusHeight - kNavgationBarHeight)

#define kX (IS_SYSTEM_VERSION_7_GREATER ? kStatusHeight + kNavgationBarHeight : 0)

//颜色
#define ASColor(R, G, B)        [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:1]
#define ASColorA(R, G, B, A)    [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:A / 255.0f]

#define VC_BG_COLOR ASColor(38, 38, 38)

//图片名字
#define LOGO_ICON_NAME @"login_icon@2x"
#define LOGO_TITLE_NAME @"login_name@2x"
#define CANDIDATE_NAME @"persons-random-preamble-1024@2x"
#define MATCH_CANCEL_BTN @"match_cancel_btn_normal@2x"
//匹配图片的名字
#define CAT_NAME        @"cat-large@2x"
#define DOG_NAME        @"dog-large@2x"
#define GHOST_NAME      @"ghost-large@2x"
#define GORILLA_NAME    @"gorilla-large@2x"
#define NINJA_NAME      @"ninja-large@2x"
#define OWL_NAME        @"owl-large@2x"
#define PANDA_NAME      @"panda-large@2x"
#define PIG_NAME        @"pig-large@2x"
#define SKULL_NAME      @"skull-large@2x"
#define SNAKE_NAME      @"snake-large@2x"
#define ARROW_TOP       @"home_open@2x"
#define ARROW_BOTTOM    @"home_close@2x"
#define EXCHANGE_BTN    @"home_reward@2x"
#define SET_BTN         @"home_menu@2x"

#define RANK_IMAGE     @"home_rank@2x"
#define START_IMAGE     @"home_begin@2x"
#define CHALLENGE_IMAGE     @"home_begin@2x"
#define DISSCUSION_IMAGE    @"home_discuss@2x"
#define SELECT_ANSWER_ICON @"home-IQtest-logo1@2x"

//创建UIIMAGE

#define IMGAE_NAME(name) [UIImage imageNamed:name]
