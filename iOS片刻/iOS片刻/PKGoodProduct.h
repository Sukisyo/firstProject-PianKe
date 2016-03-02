//
//  PKGoodProduct.h
//  iOS片刻
//
//  Created by ma c on 16/1/21.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PKGoodProductTableViewDelegate <NSObject>

- (void)pushToDetailVCWithContentid:(NSString *)contentid;

@end

@interface PKGoodProduct : UITableView

@property (nonatomic,strong) NSMutableArray *tableSource;
@property (nonatomic,weak) id<PKGoodProductTableViewDelegate> pushDelegate;

@end
