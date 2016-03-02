//
//  PKLoginViewController.h
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKBaseViewController.h"

@protocol PKLoginViewControllerDelegate <NSObject>
//登录成功后执行的代理方法
- (void)changeMineInfo:(NSURL *)headIconUrl coverimg:(NSURL *)coverimgUrl uname:(NSString *)uname;

@end

@interface PKLoginViewController : PKBaseViewController

@property (nonatomic,assign) id<PKLoginViewControllerDelegate> delegate;

@end
