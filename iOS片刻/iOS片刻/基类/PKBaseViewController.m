//
//  PKBaseViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKBaseViewController.h"



@interface PKBaseViewController ()

@end

@implementation PKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)AddBackItemBtn{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithNormalIcon:@"" highlightedIcon:@"" target:self action:@selector(backView)];
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backView{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)GETHttpRequest:(NSString *)url
                   dic:(NSDictionary *)dic
          successBlock:(HttpSuccessBlock)RequestSuccess
            errorBlock:(HttpErrorBlock)RequestError{
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
        }
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
        }
    }];
}

- (void)POSTHttpRequest:(NSString *)url
                    dic:(NSDictionary *)dic
           successBalck:(HttpSuccessBlock)RequestSuccess
             errorBlock:(HttpErrorBlock)RequestError
{
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
        }
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
        }
    }];
}
- (void)didReceiveMemoryWarning {
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
