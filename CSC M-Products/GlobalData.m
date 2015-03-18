//
//  GlobalData.m
//  CSC M-Products
//
//  Created by namle on 3/18/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData
@synthesize offsets;

+ (GlobalData*)sharedManager {
    static GlobalData *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        offsets = [[NSMutableDictionary alloc] init];
    }
    return self;
}
@end
