//
//  UILabel+AutoResizeLabel.m
//  drawer
//
//  Created by RongJun on 15/9/8.
//  Copyright (c) 2015年 RJ. All rights reserved.
//

#import "UILabel+AutoResizeLabel.h"

@implementation UILabel (AutoResizeLabel)

-(void) autoResizeUILabelHeightWithText:(NSString *)text andOriginFrame:(CGRect) frame andFont:(UIFont*)font andMaxHeight:(CGFloat)maxHeight{

    [self setNumberOfLines:0];
    
    [self setTextAlignment:(NSTextAlignmentLeft)];
    
    self.text = text;
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(frame.size.width, MAXFLOAT) options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
    
    if (size.height > maxHeight) {
        size.height = maxHeight;
    }
    
    [self setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, size.height)];

}

-(void) autoResizeUILabelWidthWithText:(NSString *)text andOriginFrame:(CGRect) frame andFont:(UIFont*)font andMaxWidth:(CGFloat)maxWidth{

    [self setNumberOfLines:0];
    
    [self setTextAlignment:(NSTextAlignmentLeft)];
    
    self.text = text;
    
    CGSize size = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, frame.size.width) options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:font} context:nil].size;
    
    if (size.width > maxWidth) {
        size.width = maxWidth;
    }
    
    [self setFrame:CGRectMake(frame.origin.x, frame.origin.y, size.width, frame.size.height)];

}

@end
