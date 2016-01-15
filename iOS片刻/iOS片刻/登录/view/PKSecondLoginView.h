//
//  PKSecondLoginView.h
//  iOS片刻
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKSecondLoginView : UIView<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *emailTextField;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UIButton *enterButton;


@end
