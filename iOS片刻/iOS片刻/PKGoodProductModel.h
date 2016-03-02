//
//	PKGoodProductModel.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKGoodProductData : NSObject

@property (nonatomic, strong) NSArray * list;
@property (nonatomic, assign) NSInteger total;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface PKGoodProductModel : NSObject

@property (nonatomic, strong) PKGoodProductData * data;
@property (nonatomic, assign) NSInteger result;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end


@interface PKGoodProductList : NSObject

@property (nonatomic, strong) NSString * buyurl;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
