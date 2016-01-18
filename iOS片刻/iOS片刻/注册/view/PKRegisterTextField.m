//
//  PKRegisterTextField.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKRegisterTextField.h"
#import "Masonry.h"

@interface PKRegisterTextField ()

@property (nonatomic,strong) UILabel *line;

@end

@implementation PKRegisterTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _label = [[UILabel alloc] init];
        [_label setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:_label];
        
        _textField = [[UITextField alloc] init];
        [_textField setBorderStyle:UITextBorderStyleNone];
        [self addSubview:_textField];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line];
    }
    return self;
}
- (void)layoutSubviews {
    WS(ws);
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.left.equalTo(ws.mas_left);
        make.size.equalTo(CGSizeMake(40, 15));
    }];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.label.mas_centerY);
        make.left.equalTo(ws.label.mas_right).offset(5);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(20);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.height.equalTo(1);
        make.top.equalTo(ws.label.mas_bottom).offset(16);
    }];
}

@end
