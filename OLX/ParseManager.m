//
//  ParseManager.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "ParseManager.h"

@implementation ParseManager

#pragma mark - Life Cycle

+ (instancetype)sharedManager
{
    static ParseManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    
    return sharedMyManager;
}

//- (id)init {
//    if (self = [super init]) {
//        self.manager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"https://olx.pt/"]];
//    }
//    return self;
//}

@end
