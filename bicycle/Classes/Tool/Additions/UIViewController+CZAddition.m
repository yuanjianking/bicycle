//
//  UIViewController+CZAddition.m
//
//  Created by linkage on 16/5/18.
//  Copyright © 2016年 yuanjian. All rights reserved.
//

#import "UIViewController+CZAddition.h"

@implementation UIViewController (CZAddition)

- (void)cz_addChildController:(UIViewController *)childController intoView:(UIView *)view  {
    
    [self addChildViewController:childController];
    
    [view addSubview:childController.view];
    
    [childController didMoveToParentViewController:self];
}

@end
