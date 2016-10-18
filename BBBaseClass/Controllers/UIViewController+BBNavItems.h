//
//  UIViewController+BBNavItems.h
//  CodeSnippets_iOS
//
//  Created by yunlong on 16/10/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString * const kNavBackImage;

@interface UIViewController (BBNavItems)

/**
 *  设置返回按钮
 */
- (void)setNavBack;
/**
 *  返回按钮的点击事件
 */
- (void)navBackAction;
/**
 *  关闭Web页面按钮 （此方法无需设置返回按钮）
 */
- (void)setNavWebClose;
/**
 *  关闭Web页面按钮点击事件
 */
- (void)navWebCloseAction;
/**
 *  设置导航栏的标题
 *
 *  @param title 标题
 */
- (UILabel *)setNavTitle:(NSString *)title;
/**
 *  设置导航右边的图片Item
 *
 *  @param image 图片
 */
- (void)setNavRightImage:(UIImage *)image;
/**
 *  设置导航右边的多张图片Item
 *
 *  @param images 图片名称字符串数组
 */
- (NSArray *)setNavRightImages:(NSArray *)images;
/**
 *  设置导航右边文字Item
 *
 *  @param title 文字
 */
- (UIBarButtonItem *)setNavRightTitle:(NSString *)title;

/**
 导航右边items的点击事件
 
 @param index 下标 从右往左 0，1，2，3 ...
 @param btn   对应items里面的按钮
 */
- (void)navRightActionsWithIndex:(NSUInteger)index button:(UIButton *)btn;



@end
