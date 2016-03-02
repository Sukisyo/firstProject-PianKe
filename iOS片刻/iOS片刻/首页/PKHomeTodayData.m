//
//	PKHomeTodayData.m
//
//	Create by c ma on 26/1/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "PKHomeTodayData.h"

@interface PKHomeTodayData ()
@end
@implementation PKHomeTodayData




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(dictionary[@"carousel"] != nil && [dictionary[@"carousel"] isKindOfClass:[NSArray class]]){
		NSArray * carouselDictionaries = dictionary[@"carousel"];
		NSMutableArray * carouselItems = [NSMutableArray array];
		for(NSDictionary * carouselDictionary in carouselDictionaries){
			PKHomeTodayCarousel * carouselItem = [[PKHomeTodayCarousel alloc] initWithDictionary:carouselDictionary];
			[carouselItems addObject:carouselItem];
		}
		self.carousel = carouselItems;
	}
	if(![dictionary[@"date"] isKindOfClass:[NSNull class]]){
		self.date = dictionary[@"date"];
	}	
	if(dictionary[@"list"] != nil && [dictionary[@"list"] isKindOfClass:[NSArray class]]){
		NSArray * listDictionaries = dictionary[@"list"];
		NSMutableArray * listItems = [NSMutableArray array];
		for(NSDictionary * listDictionary in listDictionaries){
			PKHomeTodayList * listItem = [[PKHomeTodayList alloc] initWithDictionary:listDictionary];
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
	if(self.carousel != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKHomeTodayCarousel * carouselElement in self.carousel){
			[dictionaryElements addObject:[carouselElement toDictionary]];
		}
		dictionary[@"carousel"] = dictionaryElements;
	}
	if(self.date != nil){
		dictionary[@"date"] = self.date;
	}
	if(self.list != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(PKHomeTodayList * listElement in self.list){
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
	if(self.carousel != nil){
		[aCoder encodeObject:self.carousel forKey:@"carousel"];
	}
	if(self.date != nil){
		[aCoder encodeObject:self.date forKey:@"date"];
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
	self.carousel = [aDecoder decodeObjectForKey:@"carousel"];
	self.date = [aDecoder decodeObjectForKey:@"date"];
	self.list = [aDecoder decodeObjectForKey:@"list"];
	self.total = [[aDecoder decodeObjectForKey:@"total"] integerValue];
	return self;

}
@end