//
//  UINavigationController+BBPushPop.m
//  CodeSnippets_iOS
//
//  Created by yunlong on 16/10/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import "UINavigationController+BBPushPop.h"

@implementation UINavigationController (BBPushPop)

- (void)deleteCurrentControllerAndPushNewController:(UIViewController *)newController animated:(BOOL)animated
{
    [self popViewControllerAnimated:NO];
    [self pushViewController:newController animated:animated];
}

- (void)popRootControllerAndPushNewController:(UIViewController *)newController animated:(BOOL)animated
{
    [self popToRootViewControllerAnimated:NO];
    [self pushViewController:newController animated:animated];
}

@end
