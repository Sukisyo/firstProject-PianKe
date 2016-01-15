//
//  PKSecondLoginView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSecondLoginView.h"
#import "Masonry.h"

@interface PKSecondLoginView ()

@property (nonatomic,strong) UIImageView *line1;
@property (nonatomic,strong) UIImageView *line2;
@property (nonatomic,strong) UILabel *emailLabel;
@property (nonatomic,strong) UILabel *codeLabel;

@end

@implementation PKSecondLoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _line1 = [[UIImageView alloc] init];
        [self addSubview:_line1];
        [_line1 setBackgroundColor:RGB(221, 221, 221)];
        
        _emailLabel = [[UILabel alloc] init];
        [self addSubview:_emailLabel];
        [_emailLabel setText:@"邮箱:"];
        [_emailLabel setTextColor:[UIColor blackColor]];
        
        _emailTextField = [[UITextField alloc] init];
        _emailTextField.delegate = self;
        [self addSubview:_emailTextField];
        [_emailTextField setBorderStyle:UITextBorderStyleNone];
        
        _line2 = [[UIImageView alloc] init];
        [self addSubview:_line2];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        
        _codeLabel = [[UILabel alloc] init];
        [self addSubview:_codeLabel];
        [_codeLabel setText:@"密码:"];
        [_codeLabel setTextColor:[UIColor blackColor]];
        
        _codeTextField = [[UITextField alloc] init];
        _codeTextField.delegate = self;
        [_codeTextField setSecureTextEntry:YES];
        [self addSubview:_codeTextField];
        [_codeTextField setBorderStyle:UITextBorderStyleNone];
        
        _enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_enterButton];
        [_enterButton setTitle:@"登录" forState:UIControlStateNormal];
        [_enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_enterButton setBackgroundColor:RGB(121, 181, 59)];
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(100);
        make.height.equalTo(1);
        make.left.equalTo(ws.mas_left).offset(38);
        make.right.equalTo(ws.mas_right).offset(-38);
        
    }];
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line1.mas_left);
        make.bottom.equalTo(_line1.mas_top).offset(-3);
        make.width.equalTo(40);
    }];
    [_emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_emailLabel.mas_right).offset(5);
        make.centerY.equalTo(_emailLabel.mas_centerY);
        make.height.equalTo(_emailLabel.mas_height);
        make.right.equalTo(_line1.mas_right);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_line1.mas_bottom).offset(56);
        make.height.equalTo(1);
        make.left.equalTo(ws.mas_left).offset(38);
        make.right.equalTo(ws.mas_right).offset(-38);
        
    }];
    [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line2.mas_left);
        make.bottom.equalTo(_line2.mas_top).offset(-3);
        make.width.equalTo(40);
    }];
    [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_codeLabel.mas_right).offset(5);
        make.centerY.equalTo(_codeLabel.mas_centerY);
        make.height.equalTo(_codeLabel.mas_height);
        make.right.equalTo(_line2.mas_right);
    }];
    [_enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_line2.mas_left);
        make.right.equalTo(_line2.mas_right);
        make.top.equalTo(_line2.mas_bottom).offset(35);
        make.height.equalTo(32);
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
