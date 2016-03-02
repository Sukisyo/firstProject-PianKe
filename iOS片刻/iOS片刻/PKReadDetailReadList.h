//
//	PKReadDetailReadList.h
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadDetailReadList : NSObject

@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * title;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end