//
//  PKReadListsView.h
//  iOS片刻
//
//  Created by ma c on 16/1/22.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKReadModel.h"

@protocol PKReadListDetailDelegate <NSObject>

- (void)pushToListDetailVCWithTypeid:(NSString *)typeId;

@end

@interface PKReadListsView : UIView

@property (nonatomic,strong) UIButton *writingBtn;
@property (nonatomic,strong) id<PKReadListDetailDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame andLists:(NSArray *)lists;

@end
