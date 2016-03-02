//
//  PKHomeTodayOtherTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeTodayOtherTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
//#import "NSString+Helper.h"

@interface PKHomeTodayOtherTableViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *hotImageView;
@property (nonatomic,strong) UILabel *hotCount;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKHomeTodayOtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:RGB(141, 141, 141)];
        [_nameLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:_nameLabel];
        
        _imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc] init];
        [_contentLabel setTextColor:RGB(83, 83, 83)];
        [_contentLabel setFont:[UIFont systemFontOfSize:15]];
        _contentLabel.numberOfLines = 0;
        [self.contentView addSubview:_contentLabel];
        
        _hotImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"like"]];
        [self.contentView addSubview:_hotImageView];
        
        _hotCount = [[UILabel alloc] init];
        [_hotCount setTextColor:RGB(196, 196, 196)];
        [_hotCount setFont:[UIFont systemFontOfSize:10]];
        [self.contentView addSubview:_hotCount];
        
        _line = [[UILabel alloc] init];
        [_line setBackgroundColor:RGB(221, 221, 221)];
        [self.contentView addSubview:_line];
        
    }
    return self;
}

- (void)layoutSubviews {
    WS(ws);
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.contentView.mas_top).offset(20);
        make.height.equalTo([UIFont systemFontOfSize:12].lineHeight);
    }];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.nameLabel.mas_bottom).offset(20);
        make.right.equalTo(ws.contentView.mas_right).offset(-20);
        make.height.equalTo(140 * VIEW_WIDTH / 320);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imgView.mas_left);
        make.top.equalTo(ws.imgView.mas_bottom).offset(20);
        make.right.equalTo(ws.imgView.mas_right);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imgView.mas_left);
        make.top.equalTo(ws.titleLabel.mas_bottom).offset(20);
        make.right.equalTo(ws.imgView.mas_right);
    }];
    [_line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left);
        make.bottom.equalTo(ws.contentView.mas_bottom);
        make.right.equalTo(ws.contentView.mas_right);
        make.height.equalTo(0.5);
    }];
    [_hotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.contentView.mas_bottom).offset(-20);
        make.right.equalTo(ws.contentView.mas_right).offset(-50);
        make.size.equalTo(CGSizeMake(22, 17));
    }];
    [_hotCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.hotImageView.mas_right).offset(10);
        make.centerY.equalTo(ws.hotImageView.mas_centerY);
    }];

}

- (void)setModel:(PKHomeTodayList *)model {
    _model = model;
    [_nameLabel setText:[NSString stringWithFormat:@"%@ · %@",model.name,model.enname]];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    [_titleLabel setText:model.title];
    [_contentLabel setText:model.content];
    [_hotCount setText:[NSString stringWithFormat:@"%ld",model.hot]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
