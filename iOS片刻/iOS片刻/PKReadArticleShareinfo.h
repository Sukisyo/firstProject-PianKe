//
//	PKReadArticleShareinfo.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadArticleShareinfo : NSObject

@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end