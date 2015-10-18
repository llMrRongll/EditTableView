//
//  UILabel+AutoResizeLabel.h
//  drawer
//
//  Created by RongJun on 15/9/8.
//  Copyright (c) 2015年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoResizeLabel)

-(void) autoResizeUILabelHeightWithText:(NSString *)text andOriginFrame:(CGRect) frame andFont:(UIFont*)font andMaxHeight:(CGFloat)maxHeight;

-(void) autoResizeUILabelWidthWithText:(NSString *)text andOriginFrame:(CGRect) frame andFont:(UIFont*)font andMaxWidth:(CGFloat)maxWidth;

@end
