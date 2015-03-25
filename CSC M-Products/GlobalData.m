//
//  GlobalData.m
//  CSC M-Products
//
//  Created by namle on 3/18/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "GlobalData.h"
#import "JsonHelper.h"
#import "Constant.h"
@implementation GlobalData
@synthesize offsets, contentCells;

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
        
        offsets = [NSMutableDictionary new];
        [self prepareData];
    }
    return self;
}
- (NSDictionary*)fakeData
{
    JsonHelper* helper = [JsonHelper new];
    NSString*jsonString = [helper JSONwithDictionary:[helper mainCollectionData]];
    NSDictionary* data = [helper dictionaryWithJSONString:jsonString];
    return data;
    //////////fakecelldata
    
    
}
- (void)prepareData
{
    NSMutableDictionary* exampleCell = [[NSMutableDictionary alloc]init];
    [exampleCell setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW ] forKey:@"tableViewCellStyle"];
    NSArray* imageName = @[@"IMG_1021.PNG",@"IMG_1022.PNG", @"IMG_1023.PNG",@"IMG_1024.PNG",@"IMG_1025.PNG"];
    [exampleCell setObject:imageName forKey:@"images"];
    self.contentCells = [NSMutableArray new];
    [self.contentCells addObject:exampleCell];
}
@end
