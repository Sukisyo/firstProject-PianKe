//
//  PKFirstLoginView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKFirstLoginView.h"
#import "Masonry.h"

@implementation PKFirstLoginView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_arrowBtn setImage:[UIImage imageNamed:@"返回箭头"] forState:UIControlStateNormal];
        [self addSubview:_arrowBtn];
        
        _registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:RGB(150, 150, 150) forState:UIControlStateNormal];
        [self addSubview:_registerBtn];
        
        _mainIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"图标"]];
        [self addSubview:_mainIcon];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(35);
        make.left.equalTo(ws.mas_left).offset(13);
        make.size.equalTo(CGSizeMake(16, 18));
    }];
    [_registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.arrowBtn.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-13);
    }];
    [_mainIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX);
        make.top.equalTo(ws.mas_top).offset(100);
        make.size.equalTo(CGSizeMake(97, 52));
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
