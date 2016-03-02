//
//  PKSuiPianNavigationBar.m
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianNavigationBar.h"
#import "Masonry.h"

@interface PKSuiPianNavigationBar ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *line1;
@property (nonatomic,strong) UILabel *line2;
@property (nonatomic,strong) UILabel *line3;

@end

@implementation PKSuiPianNavigationBar


- (instancetype)init
{
    self = [super init];
    if (self) {
        
//        self.userInteractionEnabled = YES;
        _sideMenuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sideMenuBtn setImage:[UIImage imageNamed:@"sidemenu"] forState:UIControlStateNormal];
        [self addSubview:_sideMenuBtn];
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setText:@"碎片"];
        [_nameLabel setTextColor:[UIColor blackColor]];
        [_nameLabel setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:_nameLabel];
        
        _tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tagBtn setImage:[UIImage imageNamed:@"biaoqiao"] forState:UIControlStateNormal];
        [self addSubview:_tagBtn];
        
        _writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writeBtn setImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
        [self addSubview:_writeBtn];
        
        _line1 = [[UILabel alloc] init];
        [_line1 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line1];
        
        _line2 = [[UILabel alloc] init];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line2];
        
        _line3 = [[UILabel alloc] init];
        [_line3 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line3];
        
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_sideMenuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(15);
        make.bottom.equalTo(ws.mas_bottom).offset(-15);
        make.size.equalTo(CGSizeMake(18, 18));
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.top.equalTo(ws.mas_top).offset(20);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(1);
    }];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.line2.mas_bottom);
        make.bottom.equalTo(ws.mas_bottom);
        make.width.equalTo(1);
        make.left.equalTo(ws.sideMenuBtn.mas_right).offset(15);
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.sideMenuBtn.mas_centerY);
        make.left.equalTo(ws.line1.mas_right).offset(5);
    }];
    [_writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-28);
        make.centerY.equalTo(ws.sideMenuBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(15, 20));
    }];
    [_tagBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.writeBtn.mas_left).offset(-28);
        make.centerY.equalTo(ws.sideMenuBtn.mas_centerY);
        make.size.equalTo(CGSizeMake(18, 18));
    }];
    [_line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.bottom.equalTo(ws.mas_bottom);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(1);
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
