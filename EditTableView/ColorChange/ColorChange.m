//
//  ColorChange.m
//  OrderGoods
//
//  Created by elink on 15/6/30.
//  Copyright (c) 2015年 elink. All rights reserved.
//

#import "ColorChange.h"

@implementation ColorChange
+(UIColor *)colorWithString:(NSString *)color
{
    NSString *colorString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]uppercaseString];
    if([colorString length] < 6)
    {
        return [UIColor clearColor];
    }
    if([colorString hasPrefix:@"0x"])
        colorString = [colorString substringFromIndex:2];
    if([colorString hasPrefix:@"#"])
        colorString = [colorString substringFromIndex:1];
    if([colorString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //red
    NSString *redString = [colorString substringWithRange:range];
    
    //green
    range.location = 2;
    NSString *greenString = [colorString substringWithRange:range];
    
    //blue
    range.location = 4;
    NSString *blueString = [colorString substringWithRange:range];
    
    //
    unsigned int r,g,b;
    [[NSScanner scannerWithString:redString] scanHexInt:&r];
    [[NSScanner scannerWithString:greenString] scanHexInt:&g];
    [[NSScanner scannerWithString:blueString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end
