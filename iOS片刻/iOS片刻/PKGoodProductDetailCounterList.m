//
//	PKGoodProductDetailCounterList.m
//
//	Create by c ma on 21/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKGoodProductDetailCounterList.h"

@interface PKGoodProductDetailCounterList ()
@end
@implementation PKGoodProductDetailCounterList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"comment"] isKindOfClass:[NSNull class]]){
		self.comment = [dictionary[@"comment"] integerValue];
	}

	if(![dictionary[@"like"] isKindOfClass:[NSNull class]]){
		self.like = [dictionary[@"like"] integerValue];
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
	dictionary[@"comment"] = @(self.comment);
	dictionary[@"like"] = @(self.like);
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
	[aCoder encodeObject:@(self.comment) forKey:@"comment"];	[aCoder encodeObject:@(self.like) forKey:@"like"];	[aCoder encodeObject:@(self.view) forKey:@"view"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.comment = [[aDecoder decodeObjectForKey:@"comment"] integerValue];
	self.like = [[aDecoder decodeObjectForKey:@"like"] integerValue];
	self.view = [[aDecoder decodeObjectForKey:@"view"] integerValue];
	return self;

}
@end