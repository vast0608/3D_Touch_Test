//
//  AppDelegate.m
//  3D_Touch_Test
//
//  Created by 李晓璐 on 2018/2/6.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController0.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //3D Touch
    if ([[UIDevice currentDevice].systemVersion floatValue]>9.0) {
        [self threeDTouchMethod];
    }
    
    return YES;
}

#pragma mark <============= 3D Touch =============>
-(void)threeDTouchMethod{
    UIApplicationShortcutIcon *icon0 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShuffle];
    UIApplicationShortcutItem *item0 = [[UIApplicationShortcutItem alloc]initWithType:@"item0" localizedTitle:@"测试" localizedSubtitle:nil icon:icon0 userInfo:nil];
    //使用自己的图片
    UIApplicationShortcutIcon *icon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"2dCode"];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"item1" localizedTitle:@"二维码" localizedSubtitle:nil icon:icon userInfo:nil];
    
    NSArray *array = @[item0,item1];
    [UIApplication sharedApplication].shortcutItems = array;
}
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    //这里可以实现界面跳转等方法
    if ([shortcutItem.type isEqualToString:@"item0"]) {
        NSLog(@"按压了第一个标题");
        ViewController0 *vc0 = [ViewController0 new];
        [(UINavigationController*)((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController pushViewController:vc0 animated:YES];
    }else if ([shortcutItem.type isEqualToString:@"item1"]) {
        NSLog(@"按压了第二个标题");
    }
}

@end
