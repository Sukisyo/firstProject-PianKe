//
//	PKHomeTodayList.m
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKHomeTodayList.h"

@interface PKHomeTodayList ()
@end
@implementation PKHomeTodayList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"content"] isKindOfClass:[NSNull class]]){
		self.content = dictionary[@"content"];
	}	
	if(![dictionary[@"coverimg"] isKindOfClass:[NSNull class]]){
		self.coverimg = dictionary[@"coverimg"];
	}	
	if(![dictionary[@"coverimg_wh"] isKindOfClass:[NSNull class]]){
		self.coverimgWh = dictionary[@"coverimg_wh"];
	}	
	if(![dictionary[@"date"] isKindOfClass:[NSNull class]]){
		self.date = dictionary[@"date"];
	}	
	if(![dictionary[@"enname"] isKindOfClass:[NSNull class]]){
		self.enname = dictionary[@"enname"];
	}	
	if(![dictionary[@"hot"] isKindOfClass:[NSNull class]]){
		self.hot = [dictionary[@"hot"] integerValue];
	}

	if(![dictionary[@"id"] isKindOfClass:[NSNull class]]){
		self.idField = dictionary[@"id"];
	}	
	if(dictionary[@"imglist"] != nil && [dictionary[@"imglist"] isKindOfClass:[NSArray class]]){
		NSArray * imglistDictionaries = dictionary[@"imglist"];
		NSMutableArray * imglistItems = [NSMutableArray array];
		for(NSDictionary * imglistDictionary in imglistDictionaries){
			PKHomeTodayImglist * imglistItem = [[PKHomeTodayImglist alloc] initWithDictionary:imglistDictionary];
			[imglistItems addObject:imglistItem];
		}
		self.imglist = imglistItems;
	}
	if(![dictionary[@"imgtotal"] isKindOfClass:[NSNull class]]){
		self.imgtotal = [dictionary[@"imgtotal"] integerValue];
	}

	if(![dictionary[@"islike"] isKindOfClass:[NSNull class]]){
		self.islike = [dictionary[@"islike"] boolValue];
	}

	if(![dictionary[@"issend"] isKindOfClass:[NSNull class]]){
		self.issend = [dictionary[@"issend"] integerValue];
	}

	if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
		self.like = [dictionary[@"like"] integerValue];
	}

	if(![dictionary[@"name"] isKindOfClass:[NSNull class]]){
		self.name = dictionary[@"name"];
	}	
	if(![dictionary[@"playInfo"] isKindOfClass:[NSNull class]]){
		self.playInfo = [[PKHomeTodayPlayInfo alloc] initWithDictionary:dictionary[@"playInfo"]];
	}

	if(dictionary[@"playList"] != nil && [dictionary[@"playList"] isKindOfClass:[NSArray class]]){
		NSArray * playListDictionaries = dictionary[@"playList"];
		NSMutableArray * playListItems = [NSMutableArray array];
		for(NSDictionary * playListDictionary in playListDictionaries){
			PKHomeTodayPlayInfo * playListItem = [[PKHomeTodayPlayInfo alloc] initWithDictionary:playListDictionary];
			[playListItems addObject:playListItem];
		}
		self.playList = playListItems;
	}
	if(![dictionary[@"songid"] isKindOfClass:[NSNull class]]){
		self.songid = dictionary[@"songid"];
	}	
	if(![dictionary[@"tag_info"] isKindOfClass:[NSNull class]]){
		self.tagInfo = [[PKHomeTodayTagInfo alloc] initWithDictionary:dictionary[@"tag_info"]];
	}

	if(![dictionary[@"ting_contentid"] isKindOfClass:[NSNull class]]){
		self.tingContentid = dictionary[@"ting_contentid"];
	}	
	if(![dictionary[@"title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"title"];
	}	
	if(![dictionary[@"type"] isKindOfClass:[NSNull class]]){
		self.type = [dictionary[@"type"] integerValue];
	}

	if(![dictionary[@"userinfo"] isKindOfClass:[NSNull class]]){
		self.userinfo = [[PKHomeTodayAuthorinfo alloc] initWithDictionary:dictionary[@"userinfo"]];
	}

	if(![dictionary[@"view"] isKindOfClass:[NSNull class]]){
		self.view = [dictionary[@"view"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.content != nil){
		dictionary[@"content"] = self.content;
	}
	if(self.coverimg != nil){
		dictionary[@"coverimg"] = self.coverimg;
	}
	if(self.coverimgWh != nil){
		dictionary[@"coverimg_wh"] = self.coverimgWh;
	}
	if(self.date != nil){
		dictionary[@"date"] = self.date;
	}
	if(self.enname != nil){
		dictionary[@"enname"] = self.enname;
	}
	dictionary[@"hot"] = @(self.hot);
	if(self.idField != nil){
		dictionary[@"id"] = self.idField;
	}
	if(self.imglist != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKHomeTodayImglist * imglistElement in self.imglist){
			[dictionaryElements addObject:[imglistElement toDictionary]];
		}
		dictionary[@"imglist"] = dictionaryElements;
	}
	dictionary[@"imgtotal"] = @(self.imgtotal);
	dictionary[@"islike"] = @(self.islike);
	dictionary[@"issend"] = @(self.issend);
	dictionary[@"like"] = @(self.like);
	if(self.name != nil){
		dictionary[@"name"] = self.name;
	}
	if(self.playInfo != nil){
		dictionary[@"playInfo"] = [self.playInfo toDictionary];
	}
	if(self.playList != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKHomeTodayPlayInfo * playListElement in self.playList){
			[dictionaryElements addObject:[playListElement toDictionary]];
		}
		dictionary[@"playList"] = dictionaryElements;
	}
	if(self.songid != nil){
		dictionary[@"songid"] = self.songid;
	}
	if(self.tagInfo != nil){
		dictionary[@"tag_info"] = [self.tagInfo toDictionary];
	}
	if(self.tingContentid != nil){
		dictionary[@"ting_contentid"] = self.tingContentid;
	}
	if(self.title != nil){
		dictionary[@"title"] = self.title;
	}
	dictionary[@"type"] = @(self.type);
	if(self.userinfo != nil){
		dictionary[@"userinfo"] = [self.userinfo toDictionary];
	}
	dictionary[@"view"] = @(self.view);
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
	if(self.content != nil){
		[aCoder encodeObject:self.content forKey:@"content"];
	}
	if(self.coverimg != nil){
		[aCoder encodeObject:self.coverimg forKey:@"coverimg"];
	}
	if(self.coverimgWh != nil){
		[aCoder encodeObject:self.coverimgWh forKey:@"coverimg_wh"];
	}
	if(self.date != nil){
		[aCoder encodeObject:self.date forKey:@"date"];
	}
	if(self.enname != nil){
		[aCoder encodeObject:self.enname forKey:@"enname"];
	}
	[aCoder encodeObject:@(self.hot) forKey:@"hot"];	if(self.idField != nil){
		[aCoder encodeObject:self.idField forKey:@"id"];
	}
	if(self.imglist != nil){
		[aCoder encodeObject:self.imglist forKey:@"imglist"];
	}
	[aCoder encodeObject:@(self.imgtotal) forKey:@"imgtotal"];	[aCoder encodeObject:@(self.islike) forKey:@"islike"];	[aCoder encodeObject:@(self.issend) forKey:@"issend"];	[aCoder encodeObject:@(self.like) forKey:@"like"];	if(self.name != nil){
		[aCoder encodeObject:self.name forKey:@"name"];
	}
	if(self.playInfo != nil){
		[aCoder encodeObject:self.playInfo forKey:@"playInfo"];
	}
	if(self.playList != nil){
		[aCoder encodeObject:self.playList forKey:@"playList"];
	}
	if(self.songid != nil){
		[aCoder encodeObject:self.songid forKey:@"songid"];
	}
	if(self.tagInfo != nil){
		[aCoder encodeObject:self.tagInfo forKey:@"tag_info"];
	}
	if(self.tingContentid != nil){
		[aCoder encodeObject:self.tingContentid forKey:@"ting_contentid"];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:@"title"];
	}
	[aCoder encodeObject:@(self.type) forKey:@"type"];	if(self.userinfo != nil){
		[aCoder encodeObject:self.userinfo forKey:@"userinfo"];
	}
	[aCoder encodeObject:@(self.view) forKey:@"view"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.content = [aDecoder decodeObjectForKey:@"content"];
	self.coverimg = [aDecoder decodeObjectForKey:@"coverimg"];
	self.coverimgWh = [aDecoder decodeObjectForKey:@"coverimg_wh"];
	self.date = [aDecoder decodeObjectForKey:@"date"];
	self.enname = [aDecoder decodeObjectForKey:@"enname"];
	self.hot = [[aDecoder decodeObjectForKey:@"hot"] integerValue];
	self.idField = [aDecoder decodeObjectForKey:@"id"];
	self.imglist = [aDecoder decodeObjectForKey:@"imglist"];
	self.imgtotal = [[aDecoder decodeObjectForKey:@"imgtotal"] integerValue];
	self.islike = [[aDecoder decodeObjectForKey:@"islike"] boolValue];
	self.issend = [[aDecoder decodeObjectForKey:@"issend"] integerValue];
	self.like = [[aDecoder decodeObjectForKey:@"like"] integerValue];
	self.name = [aDecoder decodeObjectForKey:@"name"];
	self.playInfo = [aDecoder decodeObjectForKey:@"playInfo"];
	self.playList = [aDecoder decodeObjectForKey:@"playList"];
	self.songid = [aDecoder decodeObjectForKey:@"songid"];
	self.tagInfo = [aDecoder decodeObjectForKey:@"tag_info"];
	self.tingContentid = [aDecoder decodeObjectForKey:@"ting_contentid"];
	self.title = [aDecoder decodeObjectForKey:@"title"];
	self.type = [[aDecoder decodeObjectForKey:@"type"] integerValue];
	self.userinfo = [aDecoder decodeObjectForKey:@"userinfo"];
	self.view = [[aDecoder decodeObjectForKey:@"view"] integerValue];
	return self;

}
@end