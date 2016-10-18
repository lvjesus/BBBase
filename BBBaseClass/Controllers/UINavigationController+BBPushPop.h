//
//  UINavigationController+BBPushPop.h
//  CodeSnippets_iOS
//
//  Created by yunlong on 16/10/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (BBPushPop)

/**
 *  删除当前控制器 并push到一个新的控制器
 *
 *  @param newController 新的控制器
 *  @param animated      动画
 */
- (void)deleteCurrentControllerAndPushNewController:(UIViewController *)newController animated:(BOOL)animated;
/**
 *  pop到根控制器 ，再push到新的控制器
 *
 *  @param newController 新的控制器
 *  @param animated      动画
 */
- (void)popRootControllerAndPushNewController:(UIViewController *)newController animated:(BOOL)animated;


@end
