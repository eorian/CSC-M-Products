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
@synthesize offsets, description;

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
    //fakedata for description section
    //imageViewCell
    NSMutableDictionary* imageCell = [[NSMutableDictionary alloc]init];
    [imageCell setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW ] forKey:@"tableViewCellStyle"];
    NSArray* imageName = @[@"IMG_1021.PNG",@"IMG_1022.PNG", @"IMG_1023.PNG",@"IMG_1024.PNG",@"IMG_1025.PNG"];
    [imageCell setObject:imageName forKey:@"images"];
    self.description = [NSMutableDictionary new];
    [self.description setObject:imageCell forKey:@"descriptionImages"];
    //TextCell
    NSMutableDictionary* textCellClientProfile = [NSMutableDictionary new];
    [textCellClientProfile setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT ] forKey:@"tableViewCellStyle"];
    [textCellClientProfile setObject:@"Client Profile" forKey:@"title"];
    [textCellClientProfile setObject:@"PT Tokio Marine Life Insurence Indonesia (TMLI) is one of the subsidiaries of Tokio Marine Group,  the oldest insurance group in Japan established in 1879." forKey:@"text"];
    [self.description setObject:textCellClientProfile forKey:@"descriptionText"];
}
@end
