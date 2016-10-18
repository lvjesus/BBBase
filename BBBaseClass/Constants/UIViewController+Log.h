//
//  UIViewController+Log.h
//  MCF2
//
//  Created by Mac－wuyunlong on 15/8/3.
//  Copyright (c) 2015年 ac. All rights reserved.
//打印继承UIViewController子类的类名

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIViewController (Log)
@end

@implementation UIViewController (Log)
#if DEBUG
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class aClass = [self class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(before_viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(aClass, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(aClass,originalSelector, method_getImplementation(swizzledMethod),method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(aClass,swizzledSelector,method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}
#pragma mark - Method Swizzling

- (void)before_viewWillAppear:(BOOL)animated {
    
    NSLog(@"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n-----------------------------------\n\n当前类名：---->  %@\n\n-----------------------------------",NSStringFromClass([self class]));
    [self before_viewWillAppear:animated];//此方法实际上调用的是viewWillAppear:方法
}
#endif
@end
