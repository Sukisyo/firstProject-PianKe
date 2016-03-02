//
//  PKBaseViewController.h
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "AFNetworking.h"
#import "RESideMenu.h"
#import "UIImageView+SDWedImage.h"
#import "UIView+Toast.h"
#import "NSString+Helper.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"
#import "MJRefresh.h"

typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpErrorBlock)(NSError *error);

@interface PKBaseViewController : UIViewController

- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError;

- (void)setNavigationBarWithTitle:(NSString *)title;


@end
