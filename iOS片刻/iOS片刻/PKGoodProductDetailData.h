//
//	PKGoodProductDetailData.h
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "PKGoodProductDetailCommentlist.h"
#import "PKGoodProductDetailPostsinfo.h"

@interface PKGoodProductDetailData : NSObject

@property (nonatomic, strong) NSArray * commentlist;
@property (nonatomic, assign) NSInteger commenttotal;
@property (nonatomic, assign) NSInteger isMember;
@property (nonatomic, strong) PKGoodProductDetailPostsinfo * postsinfo;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end