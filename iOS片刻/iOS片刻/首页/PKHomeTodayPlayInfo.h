//
//	PKHomeTodayPlayInfo.h
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKHomeTodayAuthorinfo.h"
#import "PKHomeTodayShareinfo.h"
#import "PKHomeTodayAuthorinfo.h"

@interface PKHomeTodayPlayInfo : NSObject

@property (nonatomic, strong) PKHomeTodayAuthorinfo * authorinfo;
@property (nonatomic, strong) NSString * imgUrl;
@property (nonatomic, strong) NSString * musicUrl;
@property (nonatomic, strong) PKHomeTodayShareinfo * shareinfo;
@property (nonatomic, strong) NSString * sharepic;
@property (nonatomic, strong) NSString * sharetext;
@property (nonatomic, strong) NSString * shareurl;
@property (nonatomic, strong) NSString * tingContentid;
@property (nonatomic, strong) NSString * tingid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKHomeTodayAuthorinfo * userinfo;
@property (nonatomic, strong) NSString * webviewUrl;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end