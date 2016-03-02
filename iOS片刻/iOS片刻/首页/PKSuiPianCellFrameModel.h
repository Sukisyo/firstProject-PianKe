//
//  PKSuiPianCellFrameModel.h
//  iOS片刻
//
//  Created by ma c on 16/1/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "List.h"

@interface PKSuiPianCellFrameModel : NSObject

@property (nonatomic,strong) List *suiPianList;

@property (nonatomic,assign,readonly) CGRect userIconFrame;
@property (nonatomic,assign,readonly) CGRect userNameFrame;
@property (nonatomic,assign,readonly) CGRect addTimeFrame;
@property (nonatomic,assign,readonly) CGRect coverimgFrame;
@property (nonatomic,assign,readonly) CGRect contentFrame;
@property (nonatomic,assign,readonly) CGRect likeFrame;
@property (nonatomic,assign,readonly) CGRect likeNumberFrame;
@property (nonatomic,assign,readonly) CGRect commentFrame;
@property (nonatomic,assign,readonly) CGRect commentNumberFrame;
@property (nonatomic,assign) BOOL isImage;


@property (nonatomic,assign) CGFloat height;

@end
