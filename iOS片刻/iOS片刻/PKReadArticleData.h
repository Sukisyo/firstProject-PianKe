//
//	PKReadArticleData.h
//
//	Create by c ma on 24/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKReadArticleCounterList.h"
#import "PKReadArticleShareinfo.h"
#import "PKReadArticleTingInfo.h"
#import "PKReadArticleTingInfo.h"
#import "PKReadArticleUserinfo.h"

@interface PKReadArticleData : NSObject

@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKReadArticleCounterList * counterList;
@property (nonatomic, strong) NSString * html;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, strong) PKReadArticleShareinfo * shareinfo;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) PKReadArticleTingInfo * tingInfo;
@property (nonatomic, strong) PKReadArticleTingInfo * topicInfo;
@property (nonatomic, assign) NSInteger typeid;
@property (nonatomic, strong) NSString * typename;
@property (nonatomic, strong) PKReadArticleUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end