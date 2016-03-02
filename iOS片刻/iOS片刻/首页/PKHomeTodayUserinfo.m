//
//	PKHomeTodayUserinfo.m
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKHomeTodayUserinfo.h"

@interface PKHomeTodayUserinfo ()
@end
@implementation PKHomeTodayUserinfo




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"uid"] isKindOfClass:[NSNull class]]){
		self.uid = [dictionary[@"uid"] integerValue];
	}

	if(![dictionary[@"uname"] isKindOfClass:[NSNull class]]){
		self.uname = dictionary[@"uname"];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[@"uid"] = @(self.uid);
	if(self.uname != nil){
		dictionary[@"uname"] = self.uname;
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
	[aCoder encodeObject:@(self.uid) forKey:@"uid"];	if(self.uname != nil){
		[aCoder encodeObject:self.uname forKey:@"uname"];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.uid = [[aDecoder decodeObjectForKey:@"uid"] integerValue];
	self.uname = [aDecoder decodeObjectForKey:@"uname"];
	return self;

}
@end