//
//  MyCell.m
//  EditTableView
//
//  Created by RongJun on 15/10/17.
//  Copyright © 2015年 RJ. All rights reserved.
//

#import "MyCell.h"
#import "UILabel+AutoResizeLabel.h"

@interface MyCell()

@property (strong, nonatomic) UILabel * myLabel;


@end

@implementation MyCell

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

    myBlock(sender.tag);

}

-(void)layoutSubviews{

    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    CGRect myLabelFrame = CGRectMake(0, 0, w/2, h - 30);
    
//    CGSize size = [myString boundingRectWithSize:CGSizeMake(myLabelFrame.size.width, MAXFLOAT) options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) attributes:@{NSFontAttributeName:myLabel.font} context:nil].size;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        myButton.frame = CGRectMake(w - 100, h - 30, 100, 30);
        
        [myLabel autoResizeUILabelHeightWithText:myString andOriginFrame:myLabelFrame andFont:[UIFont systemFontOfSize:15] andMaxHeight:MAXFLOAT];
        
        [self addSubview:myButton];
        [self addSubview:myLabel];
    }];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
