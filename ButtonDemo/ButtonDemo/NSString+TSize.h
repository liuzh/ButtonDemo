//
//  NSString+TSize.h
//  TBasicLib
//
//  Created by Jerry.jiang on 14-12-2.
//  Copyright (c) 2014年 binxun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TSize)


/**
 *  获取字符串的宽高（在指定的宽度下）
 *
 *  @param ft 字体
 *  @param w  指定宽
 *
 *  @return 字符串大大小
 */
-(CGSize)sizeWithFont:(UIFont *)ft width:(CGFloat)w;

@end
