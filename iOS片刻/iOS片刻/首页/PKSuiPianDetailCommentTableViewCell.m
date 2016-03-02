//
//  PKSuiPianDetailCommentTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/25.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianDetailCommentTableViewCell.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"

@interface PKSuiPianDetailCommentTableViewCell ()

@property (nonatomic,strong) UIButton *iconButton;
@property (nonatomic,strong) UILabel *unameLabel;
@property (nonatomic,strong) UILabel *addtimeLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *replyLabel;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKSuiPianDetailCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        _iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconButton.layer.cornerRadius = 23.0;
        _iconButton.layer.masksToBounds = YES;
        _iconButton.layer.borderColor = [RGB(221, 221, 221)CGColor];
        _iconButton.layer.borderWidth = 0.5f;
        [self.contentView addSubview:_iconButton];
        
        _unameLabel = [[UILabel alloc] init];
        [_unameLabel setFont:[UIFont systemFontOfSize:12]];
        [_unameLabel setTextColor:RGB(83, 83, 83)];
        [self.contentView addSubview:_unameLabel];
        
        _addtimeLabel = [[UILabel alloc] init];
        [_addtimeLabel setFont:[UIFont systemFontOfSize:11]];
        [_addtimeLabel setTextColor:RGB(148, 148, 148)];
        [self.contentView addSubview:_addtimeLabel];
        
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setFont:[UIFont systemFontOfSize:14]];
        [_contentLabel setTextColor:RGB(83, 83, 83)];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _replyLabel = [[UILabel alloc] init];
        [_replyLabel setTextColor:RGB(148, 148, 148)];
        [_replyLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:_replyLabel];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self.contentView addSubview:_line];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.contentView.mas_top).offset(13);
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.size.equalTo(CGSizeMake(46, 46));
    }];
    [_unameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconButton.mas_right).offset(5);
        make.centerY.equalTo(ws.iconButton.mas_centerY).offset(-10);
    }];
    [_addtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.iconButton.mas_right).offset(5);
        make.centerY.equalTo(ws.iconButton.mas_centerY).offset(10);
    }];
    [_replyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.unameLabel.mas_right).offset(10);
        make.centerY.equalTo(ws.unameLabel.mas_centerY);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.iconButton.mas_bottom).offset(20);
        make.right.equalTo(ws.contentView.mas_right).offset(20);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.right.equalTo(ws.contentView.mas_right);
        make.bottom.equalTo(ws.contentView.mas_bottom);
        make.height.equalTo(0.5);
    }];
}

- (void)setModel:(PKSuiPianDetailCommentlist *)model {
    _model = model;
    [_iconButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.userinfo.icon] forState:UIControlStateNormal];
    [_unameLabel setText:model.userinfo.uname];
    [_addtimeLabel setText:model.addtimeF];
    if (model.reuserinfo.uid) {
        [_replyLabel setText:[NSString stringWithFormat:@"回复：%@",model.reuserinfo.uname]];
    }
    [_contentLabel setText:model.content];

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
