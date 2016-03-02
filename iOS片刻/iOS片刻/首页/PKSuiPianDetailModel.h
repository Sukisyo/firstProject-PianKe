//
//	PKSuiPianDetailModel.h
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKSuiPianDetailData.h"

@interface PKSuiPianDetailModel : NSObject

@property (nonatomic, strong) PKSuiPianDetailData * SPdata;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end