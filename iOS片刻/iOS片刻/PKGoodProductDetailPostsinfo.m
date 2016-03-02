//
//	PKGoodProductDetailPostsinfo.m
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKGoodProductDetailPostsinfo.h"

@interface PKGoodProductDetailPostsinfo ()
@end
@implementation PKGoodProductDetailPostsinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"addtime"] isKindOfClass:[NSNull class]]){
		self.addtime = [dictionary[@"addtime"] integerValue];
	}

	if(![dictionary[@"addtime_f"] isKindOfClass:[NSNull class]]){
		self.addtimeF = dictionary[@"addtime_f"];
	}	
	if(![dictionary[@"contentid"] isKindOfClass:[NSNull class]]){
		self.contentid = dictionary[@"contentid"];
	}	
	if(![dictionary[@"counterList"] isKindOfClass:[NSNull class]]){
		self.counterList = [[PKGoodProductDetailCounterList alloc] initWithDictionary:dictionary[@"counterList"]];
	}

	if(![dictionary[@"groupInfo"] isKindOfClass:[NSNull class]]){
		self.groupInfo = [[PKGoodProductDetailGroupInfo alloc] initWithDictionary:dictionary[@"groupInfo"]];
	}

	if(![dictionary[@"html"] isKindOfClass:[NSNull class]]){
		self.html = dictionary[@"html"];
	}	
	if(dictionary[@"imglist"] != nil && [dictionary[@"imglist"] isKindOfClass:[NSArray class]]){
		NSArray * imglistDictionaries = dictionary[@"imglist"];
		NSMutableArray * imglistItems = [NSMutableArray array];
		for(NSDictionary * imglistDictionary in imglistDictionaries){
			PKGoodProductDetailImglist * imglistItem = [[PKGoodProductDetailImglist alloc] initWithDictionary:imglistDictionary];
			[imglistItems addObject:imglistItem];
		}
		self.imglist = imglistItems;
	}
	if(![dictionary[@"isfav"] isKindOfClass:[NSNull class]]){
		self.isfav = [dictionary[@"isfav"] boolValue];
	}

	if(![dictionary[@"ishot"] isKindOfClass:[NSNull class]]){
		self.ishot = [dictionary[@"ishot"] boolValue];
	}

	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"isrecommend"] isKindOfClass:[NSNull class]]){
		self.isrecommend = [dictionary[@"isrecommend"] boolValue];
	}

	if(![dictionary[@"shareinfo"] isKindOfClass:[NSNull class]]){
		self.shareinfo = [[PKGoodProductDetailShareinfo alloc] initWithDictionary:dictionary[@"shareinfo"]];
	}

	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKGoodProductDetailUserinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"addtime"] = @(self.addtime);
	if(self.addtimeF != nil){
		dictionary[@"addtime_f"] = self.addtimeF;
	}
	if(self.contentid != nil){
		dictionary[@"contentid"] = self.contentid;
	}
	if(self.counterList != nil){
		dictionary[@"counterList"] = [self.counterList toDictionary];
	}
	if(self.groupInfo != nil){
		dictionary[@"groupInfo"] = [self.groupInfo toDictionary];
	}
	if(self.html != nil){
		dictionary[@"html"] = self.html;
	}
	if(self.imglist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKGoodProductDetailImglist * imglistElement in self.imglist){
			[dictionaryElements addObject:[imglistElement toDictionary]];
		}
		dictionary[@"imglist"] = dictionaryElements;
	}
	dictionary[@"isfav"] = @(self.isfav);
	dictionary[@"ishot"] = @(self.ishot);
	dictionary[@"islike"] = @(self.islike);
	dictionary[@"isrecommend"] = @(self.isrecommend);
	if(self.shareinfo != nil){
		dictionary[@"shareinfo"] = [self.shareinfo toDictionary];
	}
	if(self.songid != nil){
		dictionary[@"songid"] = self.songid;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	if(self.userinfo != nil){
		dictionary[@"userinfo"] = [self.userinfo toDictionary];
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.addtime) forKey:@"addtime"];	if(self.addtimeF != nil){
		[aCoder encodeObject:self.addtimeF forKey:@"addtime_f"];
	}
	if(self.contentid != nil){
		[aCoder encodeObject:self.contentid forKey:@"contentid"];
	}
	if(self.counterList != nil){
		[aCoder encodeObject:self.counterList forKey:@"counterList"];
	}
	if(self.groupInfo != nil){
		[aCoder encodeObject:self.groupInfo forKey:@"groupInfo"];
	}
	if(self.html != nil){
		[aCoder encodeObject:self.html forKey:@"html"];
	}
	if(self.imglist != nil){
		[aCoder encodeObject:self.imglist forKey:@"imglist"];
	}
	[aCoder encodeObject:@(self.isfav) forKey:@"isfav"];	[aCoder encodeObject:@(self.ishot) forKey:@"ishot"];	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	[aCoder encodeObject:@(self.isrecommend) forKey:@"isrecommend"];	if(self.shareinfo != nil){
		[aCoder encodeObject:self.shareinfo forKey:@"shareinfo"];
	}
	if(self.songid != nil){
		[aCoder encodeObject:self.songid forKey:@"songid"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	if(self.userinfo != nil){
		[aCoder encodeObject:self.userinfo forKey:@"userinfo"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.addtime = [[aDecoder decodeObjectForKey:@"addtime"] integerValue];
	self.addtimeF = [aDecoder decodeObjectForKey:@"addtime_f"];
	self.contentid = [aDecoder decodeObjectForKey:@"contentid"];
	self.counterList = [aDecoder decodeObjectForKey:@"counterList"];
	self.groupInfo = [aDecoder decodeObjectForKey:@"groupInfo"];
	self.html = [aDecoder decodeObjectForKey:@"html"];
	self.imglist = [aDecoder decodeObjectForKey:@"imglist"];
	self.isfav = [[aDecoder decodeObjectForKey:@"isfav"] boolValue];
	self.ishot = [[aDecoder decodeObjectForKey:@"ishot"] boolValue];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.isrecommend = [[aDecoder decodeObjectForKey:@"isrecommend"] boolValue];
	self.shareinfo = [aDecoder decodeObjectForKey:@"shareinfo"];
	self.songid = [aDecoder decodeObjectForKey:@"songid"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	return self;

}
@end