//
//  PKRegisterFirstView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKRegisterFirstView.h"
#import "Masonry.h"

@implementation PKRegisterFirstView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn setImage:[UIImage imageNamed:@"注册头像"] forState:UIControlStateNormal];
        [self addSubview:_imageBtn];
        
        _arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_arrowBtn];
        [_arrowBtn setImage:[UIImage imageNamed:@"返回箭头"] forState:UIControlStateNormal];
        
        

        

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
    [_imageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX);
        make.top.equalTo(ws.mas_top).offset(65);
        make.size.equalTo(CGSizeMake(60, 60));
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
