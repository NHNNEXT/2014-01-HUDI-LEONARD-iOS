//
//  LSConstantVariable.h
//  lineSlideShow
//
//  Created by HHDD on 2/18/14.
//  Copyright (c) 2014 LinePlus. All rights reserved.
//
#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#   define NSLogFrame(obj) NSLog(@"X:%f Y:%f W:%f H:%f", obj.origin.x, obj.origin.y, obj.size.width, obj.size.height)
#   define NSLogSize(obj) NSLog(@"Width:%f  Height:%f", obj.size.width, obj.size.height)
#   define NSLogString(obj) NSLog(@"%@", obj)
#   define NSLogObj(obj) NSLog(@"%@", obj)
#else
#   define NSLog(...)
#   define NSLogFrame(obj)
#   define NSLogSize(obj)
#   define NSLogString(obj)
#   define NSLogObj(obj)
#endif

#import <Foundation/Foundation.h>

#define TRANSITION_MS 300
#define TRANSITION_BASE 1000
#define EDITOR_WIDTH 320
#define EDITOR_HEIGHT 320
#define VIDEO_WIDTH 640
#define VIDEO_HEIGHT 640
#define VIDEO_FPS 30
#define THUMB_WIDTH 100
#define THUMB_HEIGHT 100
#define PHOTO_CELL_WIDTH 106
#define PHOTO_CELL_HEIGHT 106
#define VIDEO_SIZE CGSizeMake(VIDEO_WIDTH, VIDEO_HEIGHT)
#define TITLE_LAYER_BOUNDS CGRectMake(0, 0, VIDEO_WIDTH, VIDEO_HEIGHT)
#define TRANSITION_DURATION CMTimeMake(TRANSITION_MS, TRANSITION_BASE)
#define FACEBOOK_APP_ID @"214851282054925"
#define FACEBOOK_APP_SECRET @"8b5ba8a86348bd51f88900643d6a3140"
#define TWITTER_APP_KEY @"i8dRoXQQOMiL9War3pLIA"
#define TWITTER_APP_SECRET @"oZtGUUbjF8P8GHCthXxxyGn4gGFxJnQe01PG6xzffs"
#define TWITPIC_API_KEY @"474ff5cf22a2cf4d1e054263d25f99b6"
#define STICKER_DURATION @"total"
#define STICKER_ITEM_NAME @"item"
#define STICKER_FILE_PATH @"name"
#define STICKER_FILE_DURATION @"duration"
#define IS4INCH ([[UIScreen mainScreen] bounds].size.height == 568)? YES : NO
#define PHOTO_BACKGROUND_COLOR [UIColor whiteColor].CGColor

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a / 1.0]
#define RGBLineGreen [UIColor colorWithRed:5.0/255.0 green:196.0/255.0 blue:2.0/255.0 alpha:1]
#define RGBLightGray [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1]
#define RGBLeonard [UIColor colorWithRed:35/255.0 green:153/255.0 blue:51/255.0 alpha:1]

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)

#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface LSConstantVariable : NSObject

@end
