//
//  NSString+CZPath.h
//
//  Created by linkage on 16/6/10.
//  Copyright © 2016年 yuanjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CZPath)

/// 给当前文件追加文档路径
- (NSString *)cz_appendDocumentDir;

/// 给当前文件追加缓存路径
- (NSString *)cz_appendCacheDir;

/// 给当前文件追加临时路径
- (NSString *)cz_appendTempDir;

@end
