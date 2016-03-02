//
//  PKSuiPianDetailTagView.m
//  iOS片刻
//
//  Created by ma c on 16/1/25.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianDetailTagView.h"
#import "Masonry.h"
#import "NSString+Helper.h"

@interface PKSuiPianDetailTagView ()

@property (nonatomic,strong) UIImageView *tagView;
@property (nonatomic,strong) UIButton *tageName;
@property (nonatomic,strong) UILabel *tagCount;
@property (nonatomic,strong) UILabel *line1;
@property (nonatomic,strong) UILabel *line2;

@end

@implementation PKSuiPianDetailTagView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _tagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tag"]];
        [self addSubview:_tagView];
        
        _tageName = [UIButton buttonWithType:UIButtonTypeCustom];
        [_tageName setTitleColor:RGB(152, 190, 79) forState:UIControlStateNormal];
        [_tageName.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_tageName];
        
        _tagCount = [[UILabel alloc] init];
        [_tagCount setTextColor:RGB(200, 200, 200)];
        [_tagCount setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_tagCount];
        
        _line1 = [[UILabel alloc] init];
        [_line1 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line1];
        
        _line2 = [[UILabel alloc] init];
        [_line2 setBackgroundColor:RGB(221, 221, 221)];
        [self addSubview:_line2];
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left).offset(20);
        make.centerY.equalTo(ws.mas_centerY);
        make.size.equalTo(CGSizeMake(14, 13));
    }];
    [_tageName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.tagView.mas_centerY);
        make.left.equalTo(ws.tagView.mas_right).offset(5);
    }];
    [_tagCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.tagView.mas_centerY);
        make.left.equalTo(ws.tageName.mas_right).offset(5);
    }];
    [_line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.top.equalTo(ws.mas_top);
        make.height.equalTo(0.5);
    }];
    [_line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
        make.bottom.equalTo(ws.mas_bottom);
        make.height.equalTo(0.5);
    }];
}

- (void)setModel:(PKSuiPianDetailTagInfo *)model {
    if (![model.tag isEmptyString]) {
        [_tageName setTitle:[NSString stringWithFormat:@"· %@",model.tag] forState:UIControlStateNormal];
        [_tagCount setText:[NSString stringWithFormat:@"· %ld条",(long)model.count]];
    }else {
        _tagView.hidden = YES;
        _tageName.hidden = YES;
        _tagCount.hidden = YES;
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
