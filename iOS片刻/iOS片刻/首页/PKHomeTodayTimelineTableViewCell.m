//
//  PKHomeTodayTimelineTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeTodayTimelineTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PKHomeTodayTimelineTableViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *hotImageView;
@property (nonatomic,strong) UILabel *hotCount;
@property (nonatomic,strong) UIImageView *tagImageView;
@property (nonatomic,strong) UILabel *tagLabel;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKHomeTodayTimelineTableViewCell

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
        
        _tagImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tag"]];
        _tagImageView.hidden = YES;
        [self.contentView addSubview:_tagImageView];
        
        _tagLabel = [[UILabel alloc] init];
        [_tagLabel setTextColor:RGB(196, 196, 196)];
        [_tagLabel setFont:[UIFont systemFontOfSize:10]];
        [self.contentView addSubview:_tagLabel];
        
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
//    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.contentView.mas_left).offset(20);
//        make.top.equalTo(ws.nameLabel.mas_bottom).offset(20);
//        make.right.equalTo(ws.contentView.mas_right).offset(-20);
//        make.height.equalTo(140 * VIEW_WIDTH / 320);
//    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.bottom.equalTo(ws.tagImageView.mas_top).offset(-20);
        make.right.equalTo(ws.contentView.mas_right).offset(-20);
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
    [_tagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.centerY.equalTo(ws.hotImageView.mas_centerY);
        make.size.equalTo(CGSizeMake(15, 14));
    }];
    [_tagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.tagImageView.mas_right).offset(1);
        make.centerY.equalTo(ws.tagImageView.mas_centerY);
    }];
}

- (void)setModel:(PKHomeTodayList *)model {
    _model = model;
    [_nameLabel setText:[NSString stringWithFormat:@"%@ · %@",model.name,model.enname]];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:model.coverimg]];
    NSArray *sizeArr = [model.coverimgWh componentsSeparatedByString:@"*"];
    CGFloat imageH = [sizeArr[1] floatValue] * VIEW_WIDTH / [sizeArr[0] floatValue];
    [_imgView setFrame:CGRectMake(20, 57, VIEW_WIDTH - 40, imageH)];
    [_contentLabel setText:model.content];
    if (model.tagInfo.count != 0) {
        [_tagLabel setText:[NSString stringWithFormat:@"·%@·%ld条",model.tagInfo.tag,model.tagInfo.count]];
        _tagLabel.hidden = NO;
        _tagImageView.hidden = NO;
    }else {
        _tagImageView.hidden = YES;
        _tagLabel.hidden = YES;
    }
    
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
