//
//  Ads.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "Ad.h"

@implementation Ad

#pragma mark - Mantle Mapping

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"guid"			: @"id",
              @"url"            : @"url",
              @"previewUrl"		: @"preview",
              @"title"			: @"title",
              @"created"        : @"created",
              @"adDescription"	: @"description"
              };
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
    self.adDescription = [attributes valueForKeyPath:@"description"];
    
    return self;
}

@end
