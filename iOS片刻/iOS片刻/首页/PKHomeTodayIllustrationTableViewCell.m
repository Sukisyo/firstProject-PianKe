//
//  PKHomeTodayIllustrationTableViewCell.m
//  iOS片刻
//
//  Created by ma c on 16/1/26.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKHomeTodayIllustrationTableViewCell.h"
#import "Masonry.h"
#import "UIButton+WebCache.h"
#import "DCPhotoView.h"

@interface PKHomeTodayIllustrationTableViewCell ()

@property (nonatomic,strong) UILabel *nameLabel;

@property (nonatomic,strong) UIButton *imageBtn1;
@property (nonatomic,strong) UIButton *imageBtn2;
@property (nonatomic,strong) UIButton *imageBtn3;
@property (nonatomic,strong) UILabel *imageCount;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *hotImageView;
@property (nonatomic,strong) UILabel *hotCount;
@property (nonatomic,strong) UILabel *line;

@end

@implementation PKHomeTodayIllustrationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setBackgroundColor:RGB(251, 251, 251)];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:RGB(141, 141, 141)];
        [_nameLabel setFont:[UIFont systemFontOfSize:12]];
        [self.contentView addSubview:_nameLabel];
        
        _imageBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn1.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:_imageBtn1];
        _imageBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn2.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:_imageBtn2];
        _imageBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_imageBtn3.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.contentView addSubview:_imageBtn3];
        _imageCount = [[UILabel alloc] init];
        [_imageCount setBackgroundColor:RGBAlpha(82, 82, 82, 0.5)];
        [_imageCount setTextAlignment:NSTextAlignmentCenter];
        [_imageCount setFont:[UIFont systemFontOfSize:15]];
        [_imageCount setTextColor:[UIColor whiteColor]];
        [self.contentView addSubview:_imageCount];
        
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
    CGFloat imageW = (VIEW_WIDTH - 40 - 7) / 2;
    CGFloat imageH = 138 * VIEW_WIDTH / 320;
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.contentView.mas_top).offset(20);
        make.height.equalTo([UIFont systemFontOfSize:12].lineHeight);
    }];
    [_imageBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.contentView.mas_left).offset(20);
        make.top.equalTo(ws.nameLabel.mas_top).offset(20);
        make.size.equalTo(CGSizeMake(VIEW_WIDTH - 40, 140 * VIEW_WIDTH / 320));
    }];
    [_imageBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imageBtn1.mas_left);
        make.top.equalTo(ws.imageBtn1.mas_bottom).offset(7);
        make.size.equalTo(CGSizeMake(imageW, imageH));
    }];
    [_imageBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.imageBtn1.mas_right);
        make.top.equalTo(ws.imageBtn1.mas_bottom).offset(7);
        make.size.equalTo(CGSizeMake(imageW, imageH));
    }];
    [_imageCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.imageBtn3.mas_bottom);
        make.right.equalTo(ws.imageBtn3.mas_right);
        make.size.equalTo(CGSizeMake(30, 30));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imageBtn1.mas_left);
        make.top.equalTo(ws.imageBtn3.mas_bottom).offset(20);
        make.right.equalTo(ws.imageBtn1.mas_right);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.imageBtn1.mas_left);
        make.top.equalTo(ws.titleLabel.mas_bottom).offset(20);
        make.right.equalTo(ws.imageBtn1.mas_right);
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
    [_titleLabel setText:model.title];
    [_contentLabel setText:model.content];
    [_hotCount setText:[NSString stringWithFormat:@"%ld",model.hot]];
    
    [_imageBtn1 sd_setImageWithURL:[NSURL URLWithString:[model.imglist[0] imgurl]] forState:UIControlStateNormal];
    [_imageBtn1 addTarget:self action:@selector(showPhotos) forControlEvents:UIControlEventTouchUpInside];
    [_imageBtn2 sd_setImageWithURL:[NSURL URLWithString:[model.imglist[1] imgurl]] forState:UIControlStateNormal];
    [_imageBtn3 sd_setImageWithURL:[NSURL URLWithString:[model.imglist[2] imgurl]] forState:UIControlStateNormal];
    [_imageCount setText:[NSString stringWithFormat:@"%ld",model.imglist.count]];
    
}

- (void)showPhotos {
    DCPhotoView *photoView = [[DCPhotoView alloc] initWithFrame:self.window.frame andImageUrls:self.model.imglist andIndex:0];
    [self.window addSubview:photoView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
