//
//  Macros.h
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

//各种FRAME
#define kScreen [UIScreen mainScreen].bounds
#define kScreenHeight kScreen.size.height
#define kScreenWidth kScreen.size.width

//颜色
#define ASColor(R, G, B)        [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:1]
#define ASColorA(R, G, B, A)    [UIColor colorWithRed:R / 255.0f green:G / 255.0f blue:B / 255.0f alpha:A / 255.0f]

//图片名字
#define LOGO_ICON_NAME @"logo-login-scene-480@2x"
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