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
@synthesize offsets, description, members;

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
        description = [NSMutableArray new];
        members = [NSMutableArray arrayWithArray:[self teamMembers]];
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
- (NSArray*)teamMembers
{
    NSMutableArray*persons = [NSMutableArray new];
    NSDictionary* cnguyen = @{@"memberImage":@"cnguyen.jpg",
                              @"memberName":@"Cuong Nguyen Thanh Long Name dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis ",
                              @"memberTitle":@"ASE",
                              @"memberPhone":@"123456",
                              @"memberAddress":@"366 Nguyen Trai F1, Distric 5, HCM City.",
                              @"memberEmail":@"123@xyz.com",
                              @"memberCompany":@"CSCV",
                              @"description":@"Cuong is a ABCXYZ bla-bla Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
                              };
    [persons addObject:cnguyen];
    NSDictionary* cpham = @{@"memberImage":@"cpham.jpg",
                              @"memberName":@"Chinh Pham",
                              @"memberTitle":@"SSE",
                            @"memberPhone":@"123456",
                            @"memberAddress":@"366 Nguyen Trai",
                            @"memberEmail":@"123@xyz.com",
                            @"memberCompany":@"CSCV",
                              @"description":@"Chinh is a ABCXYZ bla-bla Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
                              };
    [persons addObject:cpham];
    NSDictionary* dduong = @{@"memberImage":@"dduong.jpg",
                              @"memberName":@"Dong Duong",
                              @"memberTitle":@"PSE",
                             @"memberPhone":@"123456",
                             @"memberAddress":@"366 Nguyen Trai",
                             @"memberEmail":@"123@xyz.com",
                             @"memberCompany":@"CSCV",
                              @"description":@"Dong is a ABCXYZ bla-bla Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
                              };
    [persons addObject:dduong];
    NSDictionary* dnguyen = @{@"memberImage":@"dnguyen.jpg",
                              @"memberName":@"Duy Nguyen",
                              @"memberTitle":@"SSE",
                              @"memberPhone":@"123456",
                              @"memberAddress":@"366 Nguyen Trai",
                              @"memberEmail":@"123@xyz.com",
                              @"memberCompany":@"CSCV",
                              @"description":@"Duy is a ABCXYZ bla-bla"
                              };
    [persons addObject:dnguyen];
    NSDictionary* hhong = @{@"memberImage":@"hhong.jpg",
                              @"memberName":@"Hen Hong",
                              @"memberTitle":@"SE Designer",
                            @"memberPhone":@"123456",
                            @"memberAddress":@"366 Nguyen Trai",
                            @"memberEmail":@"123@xyz.com",
                            @"memberCompany":@"CSCV",
                              @"description":@"Hen is a ABCXYZ bla-bla"
                              };
    [persons addObject:hhong];
    NSDictionary* hma = @{@"memberImage":@"hma.jpg",
                              @"memberName":@"Hung Ma",
                              @"memberTitle":@"AEM",
                          @"memberPhone":@"123456",
                          @"memberAddress":@"366 Nguyen Trai",
                          @"memberEmail":@"123@xyz.com",
                          @"memberCompany":@"CSCV",
                              @"description":@"Hung is a ABCXYZ bla-bla"
                              };
    [persons addObject:hma];
    NSDictionary* htang = @{@"memberImage":@"htang.jpg",
                              @"memberName":@"Hai Tang",
                              @"memberTitle":@"SE",
                            @"memberPhone":@"123456",
                            @"memberAddress":@"366 Nguyen Trai",
                            @"memberEmail":@"123@xyz.com",
                            @"memberCompany":@"CSCV",
                              @"description":@"Hai is a ABCXYZ bla-bla"
                              };
    [persons addObject:htang];
    NSDictionary* lcao = @{@"memberImage":@"lcao.jpg",
                              @"memberName":@"Long Cao",
                              @"memberTitle":@"TA",
                           @"memberPhone":@"123456",
                           @"memberAddress":@"366 Nguyen Trai",
                           @"memberEmail":@"123@xyz.com",
                           @"memberCompany":@"CSCV",
                              @"description":@"Long is a ABCXYZ bla-bla"
                              };
    [persons addObject:lcao];
    NSDictionary* lngo = @{@"memberImage":@"lngo.jpg",
                              @"memberName":@"Lam Ngo",
                              @"memberTitle":@"EM",
                           @"memberPhone":@"123456",
                           @"memberAddress":@"366 Nguyen Trai",
                           @"memberEmail":@"123@xyz.com",
                           @"memberCompany":@"CSCV",
                              @"description":@"Lam is a ABCXYZ bla-bla"
                              };
    [persons addObject:lngo];
    NSDictionary* lnguyen = @{@"memberImage":@"lnguyen.jpg",
                              @"memberName":@"Linh Nguyen",
                              @"memberTitle":@"SE",
                              @"memberPhone":@"123456",
                              @"memberAddress":@"366 Nguyen Trai",
                              @"memberEmail":@"123@xyz.com",
                              @"memberCompany":@"CSCV",
                              @"description":@"Linh is a ABCXYZ bla-bla"
                              };
    [persons addObject:lnguyen];
    NSDictionary* mhoang = @{@"memberImage":@"mhoang.jpg",
                              @"memberName":@"Mai Hoang",
                              @"memberTitle":@"DOD",
                             @"memberPhone":@"123456",
                             @"memberAddress":@"366 Nguyen Trai",
                             @"memberEmail":@"123@xyz.com",
                             @"memberCompany":@"CSCV",
                              @"description":@"Mai is a ABCXYZ bla-bla"
                              };
    [persons addObject:mhoang];
    NSDictionary* mly = @{@"memberImage":@"mly.jpg",
                              @"memberName":@"Minh Ly",
                              @"memberTitle":@"ATA",
                          @"memberPhone":@"123456",
                          @"memberAddress":@"366 Nguyen Trai",
                          @"memberEmail":@"123@xyz.com",
                          @"memberCompany":@"CSCV",
                              @"description":@"Minh is a ABCXYZ bla-bla"
                              };
    [persons addObject:mly];
    NSDictionary* nle = @{@"memberImage":@"nle.jpg",
                              @"memberName":@"Nam Le",
                              @"memberTitle":@"ASE",
                          @"memberPhone":@"123456",
                          @"memberAddress":@"366 Nguyen Trai",
                          @"memberEmail":@"123@xyz.com",
                          @"memberCompany":@"CSCV",
                              @"description":@"Nam is a ABCXYZ bla-bla"
                              };
    [persons addObject:nle];
    NSDictionary* tphan = @{@"memberImage":@"tphan.jpg",
                              @"memberName":@"Trung Phan",
                            @"memberTitle":@"ASE",
                            @"memberPhone":@"123456",
                            @"memberAddress":@"366 Nguyen Trai",
                            @"memberEmail":@"123@xyz.com",
                            @"memberCompany":@"CSCV",
                              @"description":@"Trung is a ABCXYZ bla-bla"
                              };
    [persons addObject:tphan];
    
    return persons;
}
@end
