//
//  MyCell.h
//  EditTableView
//
//  Created by RongJun on 15/10/17.
//  Copyright © 2015年 RJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell

@property (strong, nonatomic) void (^myBlock)(NSInteger tag);

@property (strong, nonatomic) NSString * myString;
@property (strong, nonatomic) UIButton * myButton;


@property (nonatomic) NSInteger btnTag;

@property (nonatomic) BOOL isOpen;
@end
