//
//  Ads.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "Ad.h"
#import "Map.h"

@implementation Ad
{
    Map *map;
}

#pragma mark - Archiving

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.guid forKey:@"guid"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.previewUrl forKey:@"previewUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.created forKey:@"created"];
    [aCoder encodeObject:self.adDescription forKey:@"adDescription"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _guid = [aDecoder decodeObjectForKey:@"guid"];
        _url = [aDecoder decodeObjectForKey:@"url"];
        _previewUrl = [aDecoder decodeObjectForKey:@"previewUrl"];
        _title = [aDecoder decodeObjectForKey:@"title"];
        _created = [aDecoder decodeObjectForKey:@"created"];
        _adDescription = [aDecoder decodeObjectForKey:@"adDescription"];
    }
    return self;
}

#pragma mark - Life Cycle

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.guid = [attributes valueForKeyPath:@"id"];
    self.url = [NSURL URLWithString:[attributes valueForKeyPath:@"url"]];
    self.previewUrl = [NSURL URLWithString:[attributes valueForKeyPath:@"preview"]];
    self.title = [attributes valueForKeyPath:@"title"];
    self.created = [attributes valueForKeyPath:@"created"];
    self.adDescription = [attributes valueForKeyPath:@"description"];
    map = [[Map alloc] initWithAttributes:attributes];
    
    return self;
}

@end
