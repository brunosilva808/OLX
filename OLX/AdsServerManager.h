//
//  AdsServerManager.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface AdsServerManager : NSObject

#pragma mark - Properties

+ (instancetype)sharedManager;
@property (strong, nonatomic) AFHTTPSessionManager *manager;

#pragma mark - Methods

- (NSURLSessionDataTask *)adsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
