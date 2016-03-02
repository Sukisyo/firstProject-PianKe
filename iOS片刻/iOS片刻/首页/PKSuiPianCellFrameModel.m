//
//  PKSuiPianCellFrameModel.m
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKSuiPianCellFrameModel.h"

@interface PKSuiPianCellFrameModel ()


@end

@implementation PKSuiPianCellFrameModel

- (void)setSuiPianList:(List *)suiPianList {
    _suiPianList = suiPianList;
    
    CGFloat margin = 20;
    
    //usericon的frame
    _userIconFrame = CGRectMake(margin, margin, 30, 30);
    //username的frame
    CGFloat nameW = [NSString autoWidthWithString:_suiPianList.userinfo.uname Font:[UIFont systemFontOfSize:13]];
    CGFloat nameH = [UIFont systemFontOfSize:13].lineHeight;
    CGFloat nameX = CGRectGetMaxY(_userIconFrame) + 5;
    CGFloat nameY = (30 - nameH) / 2 + margin;
    _userNameFrame = CGRectMake(nameX, nameY, nameW, nameH);
    //addtime的frame
    CGFloat timeW = [NSString autoWidthWithString:_suiPianList.addtimeF Font:[UIFont systemFontOfSize:12]];
    CGFloat timeH = [UIFont systemFontOfSize:12].lineHeight;
    CGFloat timeX = VIEW_WIDTH - timeW - margin;
    CGFloat timeY = nameY;
    _addTimeFrame = CGRectMake(timeX, timeY, timeW, timeH);
    //coverimg的frame
    CGFloat imageY = CGRectGetMaxX(_userIconFrame) + margin;
    CGFloat imageX = margin;
    CGFloat imageW;
    CGFloat imageH;
    if ([_suiPianList.coverimgWh isEmptyString]) {
        imageW = 0;
        imageH = 0;
        _isImage = NO;
    }else {
        NSArray *sizeArray = [_suiPianList.coverimgWh componentsSeparatedByString:@"*"];
        imageW = [sizeArray[1] integerValue] > (VIEW_WIDTH - margin * 2) ? (VIEW_WIDTH - margin * 2) : [sizeArray[1] integerValue];
        imageH = [sizeArray[1] integerValue] * imageW / [sizeArray[0] integerValue];
        _isImage = YES;
    }
    _coverimgFrame = CGRectMake(imageX, imageY, imageW, imageH);
    //contentFrame
    CGFloat contentX = margin;
    CGFloat contentY;
    if (_isImage) {
        contentY = CGRectGetMaxY(_coverimgFrame) + margin;
    }else {
        contentY = CGRectGetMaxY(_coverimgFrame);
    }
    CGFloat contentW = VIEW_WIDTH - margin * 2;
    CGFloat contentH = [NSString autoHeightWithString:_suiPianList.content Width:contentW Font:[UIFont systemFontOfSize:15]];
    _contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
    //likeNumberFrame
    CGFloat likeNumberW = [NSString autoWidthWithString:[NSString stringWithFormat:@"%ld",_suiPianList.counterList.like] Font:[UIFont systemFontOfSize:11]];
    CGFloat likeNumberH = [UIFont systemFontOfSize:11].lineHeight;
    CGFloat likeNumberX = VIEW_WIDTH - likeNumberW - 10;
    CGFloat likeNumberY = CGRectGetMaxY(_contentFrame) + margin;
    _likeNumberFrame = CGRectMake(likeNumberX, likeNumberY, likeNumberW, likeNumberH);
    //likeFrame 
    CGFloat likeY = likeNumberY;
    CGFloat likeW = 22.5;
    CGFloat likeH = 17.5;
    CGFloat likeX = likeNumberX - 10 - likeW;
    _likeFrame = CGRectMake(likeX, likeY, likeW, likeH);
    //commentNumberFrame
    CGFloat commentNumberW = [NSString autoWidthWithString:[NSString stringWithFormat:@"%ld",_suiPianList.counterList.comment] Font:[UIFont systemFontOfSize:11]];
    CGFloat commentNumberH = [UIFont systemFontOfSize:11].lineHeight;
    CGFloat commentNumberX = likeX - 45 - commentNumberW;
    CGFloat commentNumberY = likeNumberY;
    _commentNumberFrame = CGRectMake(commentNumberX, commentNumberY, commentNumberW, commentNumberH);
    //commentFrame
    CGFloat commentW = 22.5;
    CGFloat commentH = 17.5;
    CGFloat commentX = commentNumberX - 10 - commentW;
    CGFloat commentY = likeNumberY;
    _commentFrame = CGRectMake(commentX, commentY, commentW, commentH);
    
    //计算cell的高度
    _height = likeY + likeH + margin;
//    _height = CGRectGetMaxX(_likeFrame) + margin;
    
}

@end
