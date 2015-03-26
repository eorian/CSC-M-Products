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
        self.description = [NSMutableArray new];
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
    [self.description addObject:imageCell];
    //TextCell
    NSMutableDictionary* textCellClientProfile = [NSMutableDictionary new];
    [textCellClientProfile setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT ] forKey:@"tableViewCellStyle"];
    [textCellClientProfile setObject:@"TMLI" forKey:@"title"];
    [textCellClientProfile setObject:@" .PT Tokio Marine Life Insurance Indonesia (TMLI) is one of the subsidiaries of Tokio Marine Group,  the oldest insurance group in Japan established in 1879.\r .The establishment of TMLI as a life insurance company in Indonesia began in 2012 with the acquisition of PT MAA Life Assurance. \r .TMLI provides a wide range of life insurance products such as unit-linked, tranditional and sharia products, which are marketed through agency as well as altenative distribution channel" forKey:@"text"];
    [self.description addObject:textCellClientProfile];
    
    NSMutableDictionary* textSolutionSummary = [NSMutableDictionary new];
    [textSolutionSummary setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT ] forKey:@"tableViewCellStyle"];
    [textSolutionSummary setObject:@"Solution Summary" forKey:@"title"];
    [textSolutionSummary setObject:@" .Implement iPOS as the font-office, web base service to facilitate capturing, updating prospect infomation and genarating of BI which can be email to prospect.\r .Implement a product rules, rates and calculations needed for genarating the Benefits Illustration for 21 products. \r .Train TMLI staff to use VPMS to configure a new/existing product from out of the box solution provided by CSC." forKey:@"text"];
    [self.description addObject:textSolutionSummary];
    
    NSMutableDictionary* abcSolutionSummary = [NSMutableDictionary new];
    [abcSolutionSummary setObject:[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT ] forKey:@"tableViewCellStyle"];
    [abcSolutionSummary setObject:@"Solution Summary" forKey:@"title"];
    [abcSolutionSummary setObject:@" .Implement iPOS as the " forKey:@"text"];
    [self.description addObject:abcSolutionSummary];
}
@end
