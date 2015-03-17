//
//  AppCategory.h
//  CSC M-Products
//
//  Created by namle on 3/16/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppItemEntity : NSObject
@property (nonatomic, strong) NSString* iconImagename;
@property (nonatomic, strong) NSString* appName;
@property (nonatomic, strong) NSString* categories;
@property (nonatomic, strong) NSString* releaseDate;
@property (nonatomic, strong) NSString* extensionLink;
@end
