//
//	PKGoodProductDetailImglist.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKGoodProductDetailImglist : NSObject

@property (nonatomic, strong) NSString * imgurl;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end