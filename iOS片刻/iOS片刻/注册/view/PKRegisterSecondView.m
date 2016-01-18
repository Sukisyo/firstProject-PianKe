//
//  PKRegisterSecondView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKRegisterSecondView.h"
#import "Masonry.h"

#define SEXBUTTONTAG 100

@interface PKRegisterSecondView ()

@property (nonatomic,strong) UILabel *descLabel;

@end

@implementation PKRegisterSecondView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _maleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_maleBtn];
        [_maleBtn setBackgroundImage:[UIImage imageNamed:@"male_normal"] forState:UIControlStateNormal];
        [_maleBtn setBackgroundImage:[UIImage imageNamed:@"male_selected"] forState:UIControlStateSelected];
        _maleBtn.tag = SEXBUTTONTAG;
        [_maleBtn addTarget:self action:@selector(sexBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _femaleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_femaleBtn];
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"female_normal"] forState:UIControlStateNormal];
        [_femaleBtn setBackgroundImage:[UIImage imageNamed:@"female_selected"] forState:UIControlStateSelected];
        _femaleBtn.tag = SEXBUTTONTAG + 1;
        [_femaleBtn addTarget:self action:@selector(sexBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _nameTextField = [[PKRegisterTextField alloc] init];
        _nameTextField.label.text = @"昵称:";
        [self addSubview:_nameTextField];
        
        _emailTextField = [[PKRegisterTextField alloc] init];
        _emailTextField.label.text = @"邮箱:";
        [self addSubview:_emailTextField];
        
        _codeTextField = [[PKRegisterTextField alloc] init];
        _codeTextField.label.text = @"密码:";
        [self addSubview:_codeTextField];
        
        _enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_enterButton];
        [_enterButton setTitle:@"完成" forState:UIControlStateNormal];
        [_enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_enterButton setBackgroundColor:RGB(121, 181, 59)];
        
        _descLabel = [[UILabel alloc] init];
        [_descLabel setText:@"点击“完成按钮”，代表你已阅读并同意"];
        [_descLabel setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:_descLabel];
        
        _deleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleButton setTitle:@"片刻协议" forState:UIControlStateNormal];
        [_deleButton setTitleColor:RGB(121, 181, 59) forState:UIControlStateNormal];
        [_deleButton.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [self addSubview:_deleButton];
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_maleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_centerX).offset(-25);
        make.top.equalTo(ws.mas_top);
        make.size.equalTo(CGSizeMake(70, 30));
    }];
    [_femaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_centerX).offset(25);
        make.top.equalTo(ws.maleBtn.mas_top);
        make.size.equalTo(CGSizeMake(70, 30));
    }];
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.maleBtn.mas_bottom).offset(30);
        make.left.equalTo(ws.mas_left).offset(35);
        make.right.equalTo(ws.mas_right).offset(-35);
        make.height.equalTo(50);
    }];
    [_emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(35);
        make.right.equalTo(ws.mas_right).offset(-35);
        make.height.equalTo(50);
        make.top.equalTo(ws.nameTextField.mas_bottom);
    }];
    [_codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(35);
        make.right.equalTo(ws.mas_right).offset(-35);
        make.height.equalTo(50);
        make.top.equalTo(ws.emailTextField.mas_bottom);
    }];
    [_enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.codeTextField.mas_bottom).offset(15);
        make.left.equalTo(ws.nameTextField.mas_left);
        make.right.equalTo(ws.nameTextField.mas_right);
        make.height.equalTo(32);
    }];
    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom).offset(-15);
        make.left.equalTo(ws.enterButton.mas_left);
    }];
    [_deleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.descLabel.mas_right).offset(3);
        make.centerY.equalTo(ws.descLabel.mas_centerY);
    }];
}

- (void)sexBtnAction:(UIButton *)sender {
    
    NSInteger index = sender.tag - SEXBUTTONTAG;
    if (sender.selected == NO) {
        sender.selected = YES;
        if (index) {
            UIButton *btn = [sender.superview viewWithTag:SEXBUTTONTAG];
            btn.selected = NO;
        }else {
            UIButton *btn = [sender.superview viewWithTag:SEXBUTTONTAG + 1];
            btn.selected = NO;
        }
    }else {
        sender.selected = NO;
        if (index) {
            UIButton *btn = [sender.superview viewWithTag:SEXBUTTONTAG];
            btn.selected = YES;
        }else {
            UIButton *btn = [sender.superview viewWithTag:SEXBUTTONTAG + 1];
            btn.selected = YES;
        }
        
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
