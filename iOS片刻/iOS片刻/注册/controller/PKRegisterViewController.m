//
//  PKRegisterViewController.m
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "PKRegisterViewController.h"
#import "PKRegisterFirstView.h"
#import "PKRegisterSecondView.h"

#define SEXBUTTONTAG 100

@interface PKRegisterViewController ()<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,strong) PKRegisterFirstView *firstView;
@property (nonatomic,strong) PKRegisterSecondView *secondView;

@property (nonatomic,strong) NSString *headIconField;

@end

@implementation PKRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:RGB(251, 251, 251)];
    
    self.navigationController.navigationBarHidden = YES;

    
    _firstView = [[PKRegisterFirstView alloc] init];
    [self.view addSubview:_firstView];
    [_firstView.imageBtn addTarget:self action:@selector(pushPhoto) forControlEvents:UIControlEventTouchUpInside];
    [_firstView.arrowBtn addTarget:self action:@selector(popVC) forControlEvents:UIControlEventTouchUpInside];
    
    _secondView = [[PKRegisterSecondView alloc] init];
    [_secondView.enterButton addTarget:self action:@selector(POSTInfo) forControlEvents:UIControlEventTouchUpInside];
    _secondView.nameTextField.textField.delegate = self;
    _secondView.emailTextField.textField.delegate = self;
    _secondView.codeTextField.textField.delegate = self;
    [self.view addSubview:_secondView];
    
    [self addLayOut];
}

- (void)addLayOut {
    WS(ws);

    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
    }];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.firstView.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
        make.height.equalTo(365);
    }];
    
}

- (void)popVC {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)pushPhoto {
    UIAlertController* alertControl = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction* action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];

    UIAlertAction* action2 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"照相" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    
    [alertControl addAction:action1];
    [alertControl addAction:action3];
    [alertControl addAction:action2];

    [self presentViewController:alertControl animated:YES completion:^{
    nil;
    }];
}

- (void)POSTInfo {
    
    NSUInteger sex = 0;
    UIButton *maleBtn = [_secondView viewWithTag:SEXBUTTONTAG];
    UIButton *femaleBtn = [_secondView viewWithTag:SEXBUTTONTAG + 1];
    if (maleBtn.selected) {
        sex = maleBtn.tag - SEXBUTTONTAG + 1;
    }else if (femaleBtn.selected){
        sex = femaleBtn.tag - SEXBUTTONTAG + 1;
    }
    if (sex == 0) {
        [self.view makeToast:@"亲您怎么可以没有性别呢" duration:1 position:@"center"];
        return;
    }
    if ([_secondView.nameTextField.textField.text isEmptyString]) {
        [self.view makeToast:@"请输入昵称" duration:1 position:@"center"];
        return;
    }
    if ([_secondView.emailTextField.textField.text isEmptyString]) {
        [self.view makeToast:@"请输入邮箱地址" duration:1 position:@"center"];
        return;
    }
    if ([_secondView.codeTextField.textField.text isEmptyString]) {
        [self.view makeToast:@"请输入您的密码" duration:1 position:@"center"];
        return;
    }
    if ([_headIconField length] == 0) {
        [self.view makeToast:@"请选择头像" duration:1 position:@"center"];
        return;
    }
    
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_secondView.emailTextField.textField.text,
                          @"gender":[NSString stringWithFormat:@"%lu",sex],
                          @"passwd":_secondView.codeTextField.textField.text,
                          @"uname":_secondView.nameTextField.textField.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_headIconField};
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
//    
//    [manager POST:@"http://api2.pianke.me/user/reg" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        UIImage *postImage = [UIImage imageWithContentsOfFile:_headIconField];
//        NSData *imageData = UIImageJPEGRepresentation(postImage, 0.1);
//        
//        [formData appendPartWithFileData:imageData name:@"iconfile" fileName:_headIconField    mimeType:@"image/png"];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        [self.view makeToast:@"注册成功" duration:1 position:@"center"];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [self.view makeToast:@"注册失败" duration:1 position:@"center"];
//    }];
    WS(weakSelf);
    [JPRefreshView showJPRefreshFromView:self.view];
    [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:dic image:_headIconField success:^(id JSON) {
        NSDictionary *returnDic = JSON;
        if ([returnDic[@"result"] integerValue] == 1) {
            [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
        }else{
            [weakSelf.view makeToast:[returnDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
    
}


#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    WS(ws);
    if (textField == _secondView.nameTextField.textField) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 0;
            ws.view.bounds = rect;
        }];
    }else if(textField == _secondView.emailTextField.textField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 40;
            ws.view.bounds = rect;
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 90;
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
    [_secondView.emailTextField.textField resignFirstResponder];
    [_secondView.codeTextField.textField resignFirstResponder];
    [_secondView.nameTextField.textField resignFirstResponder];
    WS(ws);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = ws.view.bounds;
        rect.origin.y = 0;
        ws.view.bounds = rect;
    }];
}


#pragma mark - UIImagePickerControllerDelegate 代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    NSLog(@"------------%@",homePath);
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    self.headIconField = imageViews;
    [_firstView.imageBtn setImage:editedImage forState:UIControlStateNormal];
    
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



@end
