
//
//  PKRegisterSecondView.h
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKRegisterTextField.h"

@interface PKRegisterSecondView : UIView

@property (nonatomic,strong) UIButton *maleBtn;
@property (nonatomic,strong) UIButton *femaleBtn;
@property (nonatomic,strong) PKRegisterTextField *nameTextField;
@property (nonatomic,strong) PKRegisterTextField *emailTextField;
@property (nonatomic,strong) PKRegisterTextField *codeTextField;
@property (nonatomic,strong) UIButton *enterButton;
@property (nonatomic,strong) UIButton *deleButton;

@end
