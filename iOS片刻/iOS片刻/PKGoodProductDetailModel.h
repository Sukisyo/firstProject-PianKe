//
//	PKGoodProductDetailModel.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailData.h"

@interface PKGoodProductDetailModel : NSObject

@property (nonatomic, strong) PKGoodProductDetailData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end