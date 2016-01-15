//
//  PKLeftHeadView.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLeftHeadView.h"
#import "Masonry.h"
#import "UIImage+Helper.h"


@implementation PKLeftHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backView];
        [self addSubview:self.iconImageButton];
        [self addSubview:self.userNameButton];
        [self addSubview:self.downButton];
        [self addSubview:self.collectButton];
        [self addSubview:self.messageButton];
        [self addSubview:self.writeButton];
        [self addSubview:self.searchButton];
        [self setBackgroundColor:[UIColor grayColor]];
        [self addAutoLayout];

    }
    return self;
}


- (void)addAutoLayout {
    WS(weakself);
    [_iconImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(50, 55));
        make.top.equalTo(weakself.mas_top).offset(25);
        make.left.equalTo(weakself.mas_left).offset(20);
    }];
    [_userNameButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.iconImageButton.mas_right).offset(10);
        make.centerY.equalTo(weakself.iconImageButton.mas_centerY);
        make.height.equalTo(20);
        make.right.equalTo(weakself.mas_right).offset(-60);
    }];
    CGFloat width = (VIEW_WIDTH - 80.0 - 45.0) / 5.0;
    [_downButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.top.equalTo(weakself.iconImageButton.mas_bottom).offset(15);
    }];
    [_collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.downButton.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakself.downButton.mas_centerY);
    }];
    [_messageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.collectButton.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakself.downButton.mas_centerY);
    }];
    [_writeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.messageButton.mas_right).offset(width);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakself.downButton.mas_centerY);
    }];
    [_searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.messageButton.mas_bottom).offset(15);
        make.left.equalTo(weakself.mas_left).offset(25);
        make.right.equalTo(weakself.mas_right).offset(-70);
        make.height.equalTo(26);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakself).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (UIButton *)iconImageButton {
    if (!_iconImageButton) {
        _iconImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_iconImageButton setImage:[UIImage imageNamed:@"iconImage"] forState:UIControlStateNormal];
        _iconImageButton.layer.cornerRadius = 25.0;
        _iconImageButton.layer.masksToBounds = YES;
    }
    return _iconImageButton;
}

- (UIButton *)userNameButton {
    if (!_userNameButton) {
        _userNameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_userNameButton setTitle:@"登陆 | 注册" forState:UIControlStateNormal];
        [_userNameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _userNameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//userNameButton内容文字居左
    }
    return _userNameButton;
}
- (UIButton *)downButton {
    if (!_downButton) {
        _downButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downButton setBackgroundImage:[UIImage imageNamed:@"downImage"] forState:UIControlStateNormal];
    }
    return _downButton;
}
- (UIButton *)collectButton {
    if (!_collectButton) {
        _collectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_collectButton setBackgroundImage:[UIImage imageNamed:@"collectImage"] forState:UIControlStateNormal];
    }
    return _collectButton;
}
- (UIButton *)messageButton {
    if (!_messageButton) {
        _messageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_messageButton setBackgroundImage :[UIImage imageNamed:@"messageImage"] forState:UIControlStateNormal];
    }
    return _messageButton;
}
- (UIButton *)writeButton {
    if (!_writeButton) {
        _writeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_writeButton setBackgroundImage:[UIImage imageNamed:@"writeImage"] forState:UIControlStateNormal];
    }
    return _writeButton;
}
- (UIButton *)searchButton {
    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_searchButton setBackgroundImage:[UIImage resizedImage:@"searchImage"] forState:UIControlStateNormal];
    }
    return _searchButton;
}
- (UIImageView *)backView {
    if (!_backView) {
        _backView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headViewImage.jpg"]];
    }
    return _backView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
