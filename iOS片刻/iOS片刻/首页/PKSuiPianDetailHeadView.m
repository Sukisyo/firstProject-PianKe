//
//  PKSuiPianDetailHeadView.m
//  iOS片刻
//
//  Created by ma c on 16/1/25.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianDetailHeadView.h"
#import "Masonry.h"

@interface PKSuiPianDetailHeadView ()

@end

@implementation PKSuiPianDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconButton.layer.cornerRadius = 23.0;
        _iconButton.layer.masksToBounds = YES;
        _iconButton.layer.borderColor = [RGB(221, 221, 221)CGColor];
        _iconButton.layer.borderWidth = 0.5f;
        [self addSubview:_iconButton];
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setFont:[UIFont systemFontOfSize:14]];
        [_nameLabel setTextColor:RGB(68, 67, 50)];
        [self addSubview:_nameLabel];
        
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setFont:[UIFont systemFontOfSize:14]];
        [_timeLabel setTextColor:RGB(143, 143, 143)];
        [self addSubview:_timeLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(13);
        make.top.equalTo(ws.mas_top).offset(20);
        make.size.equalTo(CGSizeMake(46, 46));
    }];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconButton.mas_right).offset(5);
        make.centerY.equalTo(ws.iconButton.mas_centerY);
    }];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_right).offset(-13);
        make.centerY.equalTo(ws.iconButton.mas_centerY);
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
