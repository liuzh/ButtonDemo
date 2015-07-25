//
//  NSString+TSize.m
//  TBasicLib
//
//  Created by Jerry.jiang on 14-12-2.
//  Copyright (c) 2014年 binxun. All rights reserved.
//

#import "NSString+TSize.h"

@implementation NSString (TSize)


-(CGSize)sizeWithFont:(UIFont *)ft width:(CGFloat)w{
    CGSize size = [self boundingRectWithSize:CGSizeMake(w, 100000)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:ft}
                                     context:nil].size;
    CGSize ceilfSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    return ceilfSize;
}

@end
