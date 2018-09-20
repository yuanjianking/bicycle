//
//  UIView+CZAddition.m
//
//  Created by linkage on 16/5/11.
//  Copyright © 2016年 yuanjian. All rights reserved.
//

#import "UIView+CZAddition.h"

@implementation UIView (CZAddition)

- (UIImage *)cz_snapshotImage {

    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
