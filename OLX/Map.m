//
//  Maps.m
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "Map.h"

@implementation Map

#pragma mark - Mantle Mapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"zoom"		: @"map_zoom",
              @"latitude"   : @"map_lat",
              @"longitude"	: @"map_lon",
              @"radius"		: @"map_radius",
              @"detail"     : @"map_show_detailed",
              @"location"	: @"map_location",
              @"cityId"     : @"city_id",
              @"regionId"   : @"region_id",
              @"cityLabel"  : @"city_label"
              };
}

#pragma mark - Archiving

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.zoom forKey:@"zoom"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
    [aCoder encodeInteger:self.radius forKey:@"radius"];
    [aCoder encodeObject:self.detail forKey:@"detail"];
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeObject:self.cityId forKey:@"cityId"];
    [aCoder encodeObject:self.regionId forKey:@"regionId"];
    [aCoder encodeObject:self.cityLabel forKey:@"cityLabel"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _zoom = [aDecoder decodeObjectForKey:@"zoom"];
        _latitude = [aDecoder decodeObjectForKey:@"latitude"];
        _longitude = [aDecoder decodeObjectForKey:@"longitude"];
        _radius = [aDecoder decodeIntegerForKey:@"radius"];
        _detail = [aDecoder decodeObjectForKey:@"detail"];
        _location = [aDecoder decodeObjectForKey:@"location"];
        _cityId = [aDecoder decodeObjectForKey:@"cityId"];
        _regionId = [aDecoder decodeObjectForKey:@"regionId"];
        _cityId = [aDecoder decodeObjectForKey:@"cityLabel"];
    }
    return self;
}

#pragma mark - Life Cycle

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.zoom = [attributes valueForKeyPath:@"map_zoom"];
    self.latitude = [attributes valueForKeyPath:@"map_lat"];;
    self.longitude = [attributes valueForKeyPath:@"map_lon"];;
    self.radius = [[attributes valueForKeyPath:@"map_radius"] integerValue];
    self.detail = [attributes valueForKeyPath:@"map_show_detailed"];
    self.location = [attributes valueForKeyPath:@"map_location"];
    self.cityId = [attributes valueForKeyPath:@"city_id"];
    self.regionId = [attributes valueForKeyPath:@"region_id"];
    self.cityId = [attributes valueForKeyPath:@"city_label"];
    
    return self;
}


@end
