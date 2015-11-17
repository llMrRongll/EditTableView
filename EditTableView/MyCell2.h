//
//  MyCell2.h
//  EditTableView
//
//  Created by RongJun on 15/11/14.
//  Copyright © 2015年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell2 : UITableViewCell

@property (strong, nonatomic) void (^myBlock)(CGFloat height);

@property (strong, nonatomic) NSString * myString;
@property (strong, nonatomic) UIButton * myButton;


@property (nonatomic) NSInteger btnTag;

@property (nonatomic) BOOL isOpen;

@property (nonatomic) CGFloat wholeHeight;

@end
