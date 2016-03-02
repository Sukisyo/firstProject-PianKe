//
//  PKLoginViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKFirstLoginView.h"
#import "PKSecondLoginView.h"
#import "PKThirdLoginView.h"
#import "PKRegisterViewController.h"


@interface PKLoginViewController ()<UITextFieldDelegate>

@property (nonatomic,strong) PKThirdLoginView *thirdView;
@property (nonatomic,strong) PKSecondLoginView *secondView;
@property (nonatomic,strong) PKFirstLoginView *firstView;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    self.navigationController.navigationBarHidden = YES;
    
    _firstView = [[PKFirstLoginView alloc] init];
    [self.view addSubview:_firstView];
    [_firstView.arrowBtn addTarget:self action:@selector(popVCAction) forControlEvents:UIControlEventTouchUpInside];
    [_firstView.registerBtn addTarget:self action:@selector(popTOVC) forControlEvents:UIControlEventTouchUpInside];
    
    _secondView = [[PKSecondLoginView alloc] init];
    _secondView.emailTextField.delegate = self;
    /**
     *  读取偏好设置中的密码
     */
    _secondView.codeTextField.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"passwd"];
    _secondView.codeTextField.delegate = self;
    [_secondView.enterButton addTarget:self action:@selector(enterAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_secondView];
    
    _thirdView = [[PKThirdLoginView alloc] init];
    [self.view addSubview:_thirdView];
    
    
    [self addAutoLayOut];
}

- (void)addAutoLayOut {
    WS(ws);
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(100);
    }];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(ws.firstView.mas_bottom);
//        make.bottom.equalTo(ws.thirdView.mas_top);
        make.centerY.equalTo(ws.view.mas_centerY);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(170);
    }];
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(110);
    }];
}

- (void)popVCAction {
    [self dismissViewControllerAnimated:YES completion:^{
        nil;
    }];
}
- (void)popTOVC {
    PKRegisterViewController *registerVC = [[PKRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WS(ws);
    if (textField == _secondView.emailTextField) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 50;
            ws.view.bounds = rect;
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 80;
            ws.view.bounds = rect;
        }];
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    WS(ws);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = ws.view.bounds;
        rect.origin.y = 0;
        ws.view.bounds = rect;
    }];
    return YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_secondView.emailTextField resignFirstResponder];
    [_secondView.codeTextField resignFirstResponder];
    WS(ws);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = ws.view.bounds;
        rect.origin.y = 0;
        ws.view.bounds = rect;
    }];
}

- (void)enterAction {
    NSDictionary *dic = @{@"auth" : @"",
                          @"client" : @"1",
                          @"deviceid" : @"D34C5085-30AE-4EA6-9E06-BA5B0C841EDA",
                          @"email" : _secondView.emailTextField.text,
                          @"passwd" : _secondView.codeTextField.text,
                          @"version" : @"3.0.6"};
    WS(ws);
    [self POSTHttpRequest:@"http://api2.pianke.me/user/login" dic:dic successBalck:^(id JSON) {
        NSDictionary *dic = JSON[@"data"];
        if ([JSON[@"result"] integerValue]) {
            
            //使用偏好设置保存数据
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//            //保存的数据
            [defaults setObject:_secondView.emailTextField.text forKey:@"email"];
            [defaults setObject:_secondView.codeTextField.text forKey:@"passwd"];
            [defaults setObject:dic[@"auth"] forKey:@"auth"];
            
            if ([ws.delegate respondsToSelector:@selector(changeMineInfo:coverimg:uname:)]) {
                [ws.delegate changeMineInfo:[NSURL URLWithString:dic[@"icon"]] coverimg:[NSURL URLWithString:dic[@"coverimg"]] uname:dic[@"uname"]];
                [ws dismissViewControllerAnimated:YES completion:nil];
            }
        }else {
            [ws.view makeToast:dic[@"msg"] duration:1 position:@"center"];
        }
        
    } errorBlock:^(NSError *error) {
        NSLog(@"%@",error);
    }];
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
