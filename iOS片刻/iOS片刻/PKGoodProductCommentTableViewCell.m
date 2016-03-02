//
//  PKGoodProductCommentTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKGoodProductCommentTableViewCell.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"
#import "NSString+Helper.h"

@interface PKGoodProductCommentTableViewCell ()

@property (nonatomic,strong) UIButton *iconButton;
@property (nonatomic,strong) UILabel *unameLabel;
@property (nonatomic,strong) UILabel *addtimeLabel;
@property (nonatomic,strong) UIButton *goodButton;
@property (nonatomic,strong) UILabel *goodNumber;
@property (nonatomic,strong) UILabel *mainLabel;
@property (nonatomic,strong) UIButton *imageButton;
@property (nonatomic,strong) UILabel *line;


@end

@implementation PKGoodProductCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _iconButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _iconButton.layer.cornerRadius = 23;
        _iconButton.layer.masksToBounds = YES;
        [self.contentView addSubview:_iconButton];
        
        _unameLabel = [[UILabel alloc] init];
        [_unameLabel setFont:[UIFont systemFontOfSize:15]];
        [_unameLabel setTextColor:RGB(83, 83, 83)];
        [self.contentView addSubview:_unameLabel];
        
        _addtimeLabel = [[UILabel alloc] init];
        [_addtimeLabel setFont:[UIFont systemFontOfSize:12]];
        [_addtimeLabel setTextColor:RGB(140, 140, 140)];
        [self.contentView addSubview:_addtimeLabel];
        
        _goodButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodButton setImage:[UIImage imageNamed:@"zan"] forState:UIControlStateNormal];
        [self.contentView addSubview:_goodButton];
        
        _goodNumber = [[UILabel alloc] init];
        [_goodNumber setFont:[UIFont systemFontOfSize:12]];
        [_goodNumber setTextColor:RGB(140, 140, 140)];
        [self.contentView addSubview:_goodNumber];
        
        _mainLabel = [[UILabel alloc] init];
        [_mainLabel setFont:[UIFont systemFontOfSize:15]];
        [_mainLabel setTextColor:RGB(83, 83, 83)];
        _mainLabel.numberOfLines = 0;
        [self.contentView addSubview:_mainLabel];
        
        _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_imageButton];
        
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
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.contentView.mas_top).offset(20);
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
    [_goodButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.unameLabel.mas_centerY);
        make.right.equalTo(ws.contentView.mas_right).offset(-36);
        make.size.equalTo(CGSizeMake(32, 32));
    }];
    [_goodNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.goodButton.mas_centerY);
        make.left.equalTo(ws.goodButton.mas_right).offset(5);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.right.equalTo(ws.contentView.mas_right);
        make.bottom.equalTo(ws.contentView.mas_bottom);
        make.height.equalTo(0.5);
    }];
}

- (void)setModel:(PKGoodProductDetailCommentlist *)model {
    
    _model = model;
    [_iconButton sd_setImageWithURL:[NSURL URLWithString:model.userinfo.icon] forState:UIControlStateNormal];
    [_unameLabel setText:model.userinfo.uname];
    [_addtimeLabel setText:model.addtimeF];
    [_goodNumber setText:[NSString stringWithFormat:@"%ld",model.likenum]];
    [_mainLabel setText:model.content];
    if (![model.coverimgWh isEmptyString]) {
        [_imageButton sd_setBackgroundImageWithURL:[NSURL URLWithString:model.coverimg] forState:UIControlStateNormal];
    }
    
}
- (void)setHeightDic:(NSDictionary *)heightDic {
    _heightDic = heightDic;
    [_mainLabel setFrame:CGRectMake(20, 75, VIEW_WIDTH - 40, [heightDic[@"textHeight"] floatValue])];
    [_imageButton setFrame:CGRectMake(20, CGRectGetMaxY(_mainLabel.frame) + 15, VIEW_WIDTH - 40, [heightDic[@"imageHeight"] floatValue])];
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
