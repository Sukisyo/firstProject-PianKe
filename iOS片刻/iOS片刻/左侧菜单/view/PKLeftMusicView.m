//
//  PKLeftMusicView.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLeftMusicView.h"
#import "Masonry.h"

@implementation PKLeftMusicView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.musicImage];
        [self addSubview:self.musicName];
        [self addSubview:self.musicFrom];
        [self addSubview:self.startBtn];
        
        
    }
    return self;
}
- (void)layoutSubviews {
    WS(weakSelf);
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(8);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.musicImage.mas_top).offset(4);
        make.left.equalTo(weakSelf.musicImage.mas_right).offset(18);
        make.height.equalTo(20);
        make.right.equalTo(weakSelf.startBtn.mas_left).offset(-5);
    }];
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.musicName.mas_left);
        make.top.equalTo(weakSelf.musicName.mas_bottom);
        make.right.equalTo(weakSelf.startBtn.mas_left).offset(-5);
    }];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).offset(-70);
        make.size.equalTo(CGSizeMake(20, 20));
    }];
}

- (UIImageView *)musicImage {
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"musicIconImage"]];
    }
    return _musicImage;
}
- (UILabel *)musicName {
    if (!_musicName) {
        _musicName = [[UILabel alloc] init];
        _musicName.textColor = [UIColor whiteColor];
        _musicName.textAlignment = NSTextAlignmentLeft;
        _musicName.font = [UIFont systemFontOfSize:15];
        _musicName.text = @"斑马斑马";
    }
    return _musicName;
}
- (UILabel *)musicFrom {
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc] init];
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        _musicFrom.font = [UIFont systemFontOfSize:10];
        _musicFrom.text = @"IU";
    }
    return _musicFrom;
}
- (UIButton *)startBtn {
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"playImage"] forState:UIControlStateNormal];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"stopImage"] forState:UIControlStateSelected];
        [_startBtn addTarget:self action:@selector(startBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startBtn;
}
- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.backgroundColor = RGB(28, 28, 28);
        [_backBtn addTarget:self action:@selector(backBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
- (void)backBtnAction {
//    NSLog(@"back");
}
- (void)startBtnAction:(UIButton *)sender {
    
    if (sender.selected == NO) {
        sender.selected = YES;
    }else {
        sender.selected = NO;
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
