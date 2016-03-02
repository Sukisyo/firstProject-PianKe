//
//	PKGoodProductDetailPostsinfo.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailCounterList.h"
#import "PKGoodProductDetailGroupInfo.h"
#import "PKGoodProductDetailImglist.h"
#import "PKGoodProductDetailShareinfo.h"
#import "PKGoodProductDetailUserinfo.h"

@interface PKGoodProductDetailPostsinfo : NSObject

@property (nonatomic, assign) NSInteger addtime;
@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) PKGoodProductDetailCounterList * counterList;
@property (nonatomic, strong) PKGoodProductDetailGroupInfo * groupInfo;
@property (nonatomic, strong) NSString * html;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) BOOL isfav;
@property (nonatomic, assign) BOOL ishot;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) BOOL isrecommend;
@property (nonatomic, strong) PKGoodProductDetailShareinfo * shareinfo;
@property (nonatomic, strong) NSString * songid;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) PKGoodProductDetailUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end