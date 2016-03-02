//
//	PKReadDetailReadData.m
//
//	Create by c ma on 23/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKReadDetailReadData.h"

@interface PKReadDetailReadData ()
@end
@implementation PKReadDetailReadData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"columnsInfo"] isKindOfClass:[NSNull class]]){
		self.columnsInfo = [[PKReadDetailReadColumnsInfo alloc] initWithDictionary:dictionary[@"columnsInfo"]];
	}

	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			PKReadDetailReadList * listItem = [[PKReadDetailReadList alloc] initWithDictionary:listDictionary];
			[listItems addObject:listItem];
		}
		self.list = listItems;
	}
	if(![dictionary[@"total"] isKindOfClass:[NSNull class]]){
		self.total = [dictionary[@"total"] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.columnsInfo != nil){
		dictionary[@"columnsInfo"] = [self.columnsInfo toDictionary];
	}
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKReadDetailReadList * listElement in self.list){
			[dictionaryElements addObject:[listElement toDictionary]];
		}
		dictionary[@"list"] = dictionaryElements;
	}
	dictionary[@"total"] = @(self.total);
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
	if(self.columnsInfo != nil){
		[aCoder encodeObject:self.columnsInfo forKey:@"columnsInfo"];
	}
	if(self.list != nil){
		[aCoder encodeObject:self.list forKey:@"list"];
	}
	[aCoder encodeObject:@(self.total) forKey:@"total"];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.columnsInfo = [aDecoder decodeObjectForKey:@"columnsInfo"];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.total = [[aDecoder decodeObjectForKey:@"total"] integerValue];
	return self;

}
@end