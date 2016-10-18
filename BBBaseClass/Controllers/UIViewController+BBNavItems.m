//
//  UIViewController+BBNavItems.m
//  CodeSnippets_iOS
//
//  Created by yunlong on 16/10/17.
//  Copyright © 2016年 yunlong. All rights reserved.
//

#import "UIViewController+BBNavItems.h"

//#import "YYCategories.h"

NSString * const kNavBackImage = @"Nav_back";

@implementation UIViewController (BBNavItems)

- (void)setNavBack{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backButton setImage:[UIImage imageNamed:kNavBackImage] forState:UIControlStateNormal];
    backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    [backButton addTarget:self action:@selector(navBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)navBackAction{
    if (self.navigationController.viewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)setNavWebClose{
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44 , 44)];
    [backButton setImage:[UIImage imageNamed:kNavBackImage] forState:UIControlStateNormal];
    [backButton setTitle:@" 返回" forState:UIControlStateNormal];
    [backButton setTitleColor:UIColorHex(333333) forState:UIControlStateNormal];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton addTarget:self action:@selector(navBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIButton *webCloseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [webCloseBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [webCloseBtn setTitleColor:UIColorHex(333333) forState:UIControlStateNormal];
    webCloseBtn.titleLabel.font = [UIFont systemFontOfSize:14];;
    webCloseBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    //    webCloseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    [webCloseBtn addTarget:self action:@selector(navWebCloseAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *webCloseBtnItem = [[UIBarButtonItem alloc] initWithCustomView:webCloseBtn];
    
    [self.navigationItem setLeftBarButtonItems:@[backItem,webCloseBtnItem] animated:YES];
}

- (void)navWebCloseAction{
    
}

- (UILabel *)setNavTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = UIColorHex(333333);
    NSDictionary *attr = @{NSFontAttributeName : label.font};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, label.height)
                                        options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attr
                                        context:nil].size.width;
    label.width = width;
    self.navigationItem.titleView = label;
    return label;
}

- (void)setNavRightImage:(UIImage *)image{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat imageWidth = image.size.width;
    if (imageWidth < 30) imageWidth = 30;
    btn.frame = CGRectMake(0, 0, imageWidth, 44);
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item1;
}

- (NSArray *)setNavRightImages:(NSArray *)images{
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < images.count; i ++){
        UIImage *image = [UIImage imageNamed:images[i]];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat imageWidth = image.size.width;
        if (imageWidth < 30) imageWidth = 30;
        btn.frame = CGRectMake(0, 0, imageWidth, 44);
        [btn setImage:image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(navRightActions:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000 + i;
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [items addObject:item];
    }
    
    self.navigationItem.rightBarButtonItems = items;
    return items;
}

- (UIBarButtonItem *)setNavRightTitle:(NSString *)title{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:UIColorHex(333333) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    NSDictionary *attr = @{NSFontAttributeName : btn.titleLabel.font};
    CGFloat width = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, btn.height)
                                        options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attr
                                        context:nil].size.width;
    if (width < 30) width = 30;
    btn.width = width;
    [btn addTarget:self action:@selector(navRightAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item1;
    return item1;
}

- (void)navRightAction:(UIButton *)btn{
    [self navRightActionsWithIndex:0 button:btn];
}

- (void)navRightActions:(UIButton *)btn{
    [self navRightActionsWithIndex:btn.tag - 1000 button:btn];
}

- (void)navRightActionsWithIndex:(NSUInteger)index button:(UIButton *)btn{
    
}



@end
