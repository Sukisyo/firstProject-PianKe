//
//	PKReadArticleUserinfo.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface PKReadArticleUserinfo : NSObject

@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) BOOL isfollow;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, strong) NSString * uname;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end