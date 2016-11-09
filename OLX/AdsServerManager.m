//
//  AdsServerManager.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "AdsServerManager.h"
#import "Ad.h"
#import "PersistentManager.h"
#import "MTLJSONAdapter.h"

@implementation AdsServerManager
{
    PersistentManager *persistentManager;
}

#pragma mark - Life Cycle

+ (instancetype)sharedManager
{
    static AdsServerManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"https://olx.pt/"]];
        persistentManager = [[PersistentManager alloc] init];
    }
    return self;
}

#pragma mark -

- (NSURLSessionDataTask *)adsWithBlock:(void (^)(NSArray *posts, NSError *error))block{
        
    return [self.manager GET:@"i2/ads/?json=1&search[category_id]=25" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        NSError *error = nil;
        NSArray *adsArray = [[MTLJSONAdapter modelsOfClass:Ad.class
                                            fromJSONArray:[JSON valueForKeyPath:@"ads"]
                                                    error:&error] mutableCopy];
        
        [persistentManager saveAds:[adsArray mutableCopy]];
        
        if (block) {
            block([NSArray arrayWithArray:adsArray], error);
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([persistentManager loadAds], error);
        }
    }];

}


@end
