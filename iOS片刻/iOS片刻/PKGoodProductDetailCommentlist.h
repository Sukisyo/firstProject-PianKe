//
//	PKGoodProductDetailCommentlist.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailReuserinfo.h"
#import "PKGoodProductDetailUserinfo.h"

@interface PKGoodProductDetailCommentlist : NSObject

@property (nonatomic, strong) NSString * addtimeF;
@property (nonatomic, assign) NSInteger cmtnum;
@property (nonatomic, strong) NSString * content;
@property (nonatomic, strong) NSString * contentid;
@property (nonatomic, strong) NSString * coverimg;
@property (nonatomic, strong) NSString * coverimgWh;
@property (nonatomic, strong) NSArray * imglist;
@property (nonatomic, assign) BOOL isdel;
@property (nonatomic, assign) BOOL islike;
@property (nonatomic, assign) NSInteger likenum;
@property (nonatomic, strong) PKGoodProductDetailReuserinfo * reuserinfo;
@property (nonatomic, strong) PKGoodProductDetailUserinfo * userinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end