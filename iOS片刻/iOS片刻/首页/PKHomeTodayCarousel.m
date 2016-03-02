//
//	PKHomeTodayCarousel.m
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKHomeTodayCarousel.h"

@interface PKHomeTodayCarousel ()
@end
@implementation PKHomeTodayCarousel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"count"] isKindOfClass:[NSNull class]]){
		self.count = [dictionary[@"count"] integerValue];
	}

	if(![dictionary[@"img"] isKindOfClass:[NSNull class]]){
		self.img = dictionary[@"img"];
	}	
	if(![dictionary[@"url"] isKindOfClass:[NSNull class]]){
		self.url = dictionary[@"url"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"count"] = @(self.count);
	if(self.img != nil){
		dictionary[@"img"] = self.img;
	}
	if(self.url != nil){
		dictionary[@"url"] = self.url;
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
	[aCoder encodeObject:@(self.count) forKey:@"count"];	if(self.img != nil){
		[aCoder encodeObject:self.img forKey:@"img"];
	}
	if(self.url != nil){
		[aCoder encodeObject:self.url forKey:@"url"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.count = [[aDecoder decodeObjectForKey:@"count"] integerValue];
	self.img = [aDecoder decodeObjectForKey:@"img"];
	self.url = [aDecoder decodeObjectForKey:@"url"];
	return self;

}
@end