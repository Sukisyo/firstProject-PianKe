//
//	PKSuiPianDetailTagInfo.h
//
//	Create by c ma on 25/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKSuiPianDetailTagInfo : NSObject

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL offical;
@property (nonatomic, strong) NSString * tag;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end