//
//  MyCell.m
//  EditTableView
//
//  Created by RongJun on 15/10/17.
//  Copyright © 2015年 RJ. All rights reserved.
//

#import "MyCell2.h"
#import "UILabel+AutoResizeLabel.h"
#import "ColorChange.h"

@interface MyCell2()

@property (strong, nonatomic) UILabel * myLabel;


@end

@implementation MyCell2
{
    NSString * tempString;
}
@synthesize myBlock;
@synthesize myButton;
@synthesize myString;
@synthesize myLabel;

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    
    return self;
    
}

-(void)initUI {
    
    self.backgroundColor = [self randomColor];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    myButton = [[UIButton alloc] init];
    [myButton setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [myButton setTitle:@"展开" forState:(UIControlStateNormal)];
    [myButton addTarget:self action:@selector(btnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [myButton setTag:self.btnTag];
    
    myLabel = [[UILabel alloc] init];
    [myLabel setTextColor:[UIColor blackColor]];
    [myLabel setFont:[UIFont systemFontOfSize:15]];
    
}



-(void)btnAction:(UIButton*)sender {
    
    if (self.isOpen) {
        tempString = [myString substringToIndex:20];
    } else {
        tempString = myString;
    }
    
    self.isOpen = !self.isOpen;
    
    [self layoutSubviews];
    
    self.wholeHeight = self.frame.size.height;
    
    self.myBlock(self.wholeHeight);
    
}

-(void)layoutSubviews{
    
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    CGRect myLabelFrame = CGRectMake(0, 0, w/2, h - 30);
    
    //    CGSize size = [myString boundingRectWithSize:CGSizeMake(myLabelFrame.size.width, MAXFLOAT) options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:myLabel.font} context:nil].size;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        myButton.frame = CGRectMake(w - 100, 10, 100, 30);
        
        [myLabel autoResizeUILabelHeightWithText:tempString andOriginFrame:myLabelFrame andFont:[UIFont systemFontOfSize:15] andMaxHeight:MAXFLOAT];
        
        [self addSubview:myButton];
        [self addSubview:myLabel];
        
        CGRect selfFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, myLabel.frame.origin.y + myLabel.frame.size.height + 30);
        
        self.frame = selfFrame;
    }];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(UIColor *) randomColor {
    
    CGFloat r = random()%255;
    CGFloat g = random()%255;
    CGFloat b = random()%255;
    
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:1];
    
}

@end
