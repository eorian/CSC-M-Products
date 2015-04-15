//
//  JsonHelper.m
//  CSC M-Products
//
//  Created by namle on 3/16/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "JsonHelper.h"
#import "Constant.h"
@implementation JsonHelper


- (NSString *)JSONwithDictionary:(NSDictionary *)dictionary
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return jsonString;
    }
    return nil;
}

- (NSDictionary*)dictionaryWithJSONString:(NSString*)JSONString
{
    NSError *jsonError;
    NSData *objectData = [JSONString  dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&jsonError];
    return json;
}

- (NSArray*)headerData
{
    NSArray* data = @[
                      @"header1.png",
                      @"header2.png",
                      @"header3.png"
                      ];
    return data;
}
- (NSDictionary*)appData
{
    NSMutableDictionary* apps = [NSMutableDictionary new];
    NSArray* iOS = @[
                     @{@"iconImage":@"qatar_icon.jpg",
                       @"appName":@"Diary",
                       @"Catelogy":@"iOS",
                       @"releseDate":@"",
                       @"partner":@"Quatar Airway",
                       @"extensionLink":@"",
                       @"description":@[
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                   @"images":@[@"quata_ios1.PNG",@"quata_ios2.PNG",@"quata_ios3.PNG"]
                                   },
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                   @"title":@"Qatar Airway",
                                   @"text":@" Qatar Airways Company Q.C.S.C., operating as Qatar Airways, is the state-owned flag carrier of Qatar. Headquartered in the Qatar Airways Tower in Doha, it operates a hub-and-spoke network, linking over 100 international destinations from its base in Doha, using a fleet of more than 100 aircraft."
                                   },
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                   @"title":@"About Diary",
                                   @"text":@"  Diary is an iOS and Android application that will display the employee’s and the employee’s dependents’ passport/resident permit/id card data on the device and alerting the employee when the expiration of these data features approaches at a certain timeframe."
                                   }
                               ],
                       @"technology":@[],
                       @"teamsize":[self teamMembers]
                       },
                     
                    @{@"iconImage":@"johnsoncontrol_icon.png",
                      @"appName":@"Home Comfort Center",
                      @"Catelogy":@"iOS",
                      @"releseDate":@"",
                      @"partner":@"Johnson Controls",
                      @"extensionLink":@"",
                      @"description":@[
                              @{
                                  @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                  @"images":@[@"johnson_ios1.PNG",@"johnson_ios2.PNG",@"johnson_ios3.PNG"]
                                  },
                              @{
                                  @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                  @"title":@"Johnson Controls",
                                  @"text":@" Johnson Controls, Inc. is an American company globally offering products and services to optimize energy and operational efficiencies of buildings, automotive batteries, electronics and interior systems for automobiles."
                                  },
                              @{
                                  @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                  @"title":@"About Home Comfort Center",
                                  @"text":@"  Home Comfort Center (HCC) is a mobile application that has been built to run on both the iOS and Android platforms. To enable execution across the iOS and Android platforms, the application was built using a tool called AppMobi."
                                  },
                              @{
                                  @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                  @"title":@"Bussiness Challenges",
                                  @"text":@" CSC was requested to fully rewrite current HCC Mobile app using HTML5 & JQuerryMobile for three brands which are York, Luxairie and Coleman. The applications need to support iOS and Android tablets."
                                  }
                              ],
                      @"technology":@[],
                      @"teamsize":[self teamMembers]
                      }
                              ];
    NSArray* android = @[
                     @{@"iconImage":@"emirates_icon.png",
                       @"appName":@"Emirates Fly Fare",
                       @"Catelogy":@"Android",
                       @"releseDate":@"",
                       @"partner":@"Emirates",
                       @"extensionLink":@"",
                       @"description":@[
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                   @"images":@[@"emirates_android1.PNG",@"emirates_android2.PNG"]
                                   },
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                   @"title":@"Emirates",
                                   @"text":@" Emirates is a fast-growing international airline with one of the youngest fleets in the sky and more than 400 awards for excellence worldwide. Underscoring its incredible growth, the airline is currently the world’s largest operator of both the Airbus A380 and Boeing 777."
                                   },
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                   @"title":@"About Emirates Fly Fare",
                                   @"text":@"  Emirates released an iPad application to Apple App Store on March, 2014. The app serves as customers’ personal journey planner that makes it simpler to view and arrange their trips when they’re on the go. They after that engaged another vendor to developer the Android version of the application but the vendor was failed to deliver the app as scheduled."
                                   },
                               @{
                                   @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                   @"title":@"Bussiness Challenges",
                                   @"text":@"  Emirates has requested CSC to develop the Fly Fare Branding module of Android application. In Android application, Fly and Fare Branding will be merged into one module called Fly Fare Branding module."
                                   }
                               ],
                       @"technology":@[],
                       @"teamsize":[self teamMembers]
                       }                     ];
    NSArray* crossPlatform = @[
                         
                         @{@"iconImage":@"johnsoncontrol_icon.png",
                           @"appName":@"Home Comfort Center",
                           @"Catelogy":@"CrossPlatform",
                           @"releseDate":@"",
                           @"partner":@"Johnson Controls",
                           @"extensionLink":@"",
                           @"description":@[
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                       @"images":@[@"johnson_ios1.PNG",@"johnson_ios2.PNG",@"johnson_ios3.PNG"]
                                       },
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                       @"title":@"Johnson Controls",
                                       @"text":@" Johnson Controls, Inc. is an American company globally offering products and services to optimize energy and operational efficiencies of buildings, automotive batteries, electronics and interior systems for automobiles."
                                       },
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                       @"title":@"About Home Comfort Center",
                                       @"text":@"  Home Comfort Center (HCC) is a mobile application that has been built to run on both the iOS and Android platforms. To enable execution across the iOS and Android platforms, the application was built using a tool called AppMobi."
                                       },
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                       @"title":@"Bussiness Challenges",
                                       @"text":@" CSC was requested to fully rewrite current HCC Mobile app using HTML5 & JQuerryMobile for three brands which are York, Luxairie and Coleman. The applications need to support iOS and Android tablets."
                                       }
                                   
                                   ],
                           @"technology":@[],
                           @"teamsize":[self teamMembers]
                           },
                         @{@"iconImage":@"p&t_icon.png",
                           @"appName":@"Pratt&Whitney",
                           @"Catelogy":@"CrossPlatform",
                           @"releseDate":@"",
                           @"partner":@"Pratt & Whitney Canada",
                           @"extensionLink":@"",
                           @"description":@[
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                       @"images":@[@"p&t_cross1.PNG",@"p&t_cross2.PNG",@"p&t_cross3.PNG",@"p&t_cross4.PNG"]
                                       },
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                       @"title":@"Pratt & Whitney Canadian",
                                       @"text":@" Pratt & Whitney Canada Corp. (P&WC), based in Longueuil, Quebec, is a global aerospace leader, shaping the future of business, helicopter and regional aviation with new generation engines. The company also offers advanced engines for industrial applications."
                                       },
                                   @{
                                       @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                       @"title":@"Bussiness Challenges",
                                       @"text":@"  CSC was asked to create a Responsive Web Design (RWD) to allow Pratt & Whitney Canada owner/operators to find the nearest field service representative and facilities using geo-location on their mobile device.\r  CSC’s User Experience team created the design using our Vis-EDGE process, and the Mobility Team used HTML5 and JQuery Mobile to deliver an elegant and intuitive design."
                                       }
                                                                      ],
                           @"technology":@[],
                           @"teamsize":[self teamMembers]
                           },
                         ];
NSArray* windows = @[
                             
                             @{@"iconImage":@"truven_icon.jpg",
                               @"appName":@"Data Probe",
                               @"Catelogy":@"Windows",
                               @"releseDate":@"",
                               @"partner":@"Truven Health Analytics",
                               @"extensionLink":@"",
                               @"description":@[
                                       @{
                                           @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_IMAGEVIEW],
                                           @"images":@[@"truven_web1.PNG",@"truven_web2.PNG"]
                                           },
                                       @{
                                           @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                           @"title":@"Truven Health Analytics",
                                           @"text":@" Truven Health Analytics delivers unbiased information, analytic tools, benchmarks, and services to the healthcare industry. Hospitals, government agencies, employers, health plans, clinicians, and pharmaceutical and medical device companies have relied on us for more than 30 years."
                                           },
                                       @{
                                           @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                           @"title":@"About Data Probe",
                                           @"text":@"  DataProbe is a high-performance data management and analysis system that enhances the productivity of healthcare analysts, fraud investigators, researchers, and other professional staff when performing complex analysis and deep-dive, unstructured, iterative, data-intensive investigation."
                                           },
                                       @{
                                           @"tableViewStyle":[NSNumber numberWithInt:TABLEVIEWCELL_STYLE_PLAINTEXT],
                                           @"title":@"Bussiness Challenges",
                                           @"text":@" CSC’s User Experience team created the design using our Vis-EDGE process to improve the Usability and Performance of the application."
                                           }
                                       
                                       ],
                               @"technology":@[],
                               @"teamsize":[self teamMembers]
                               }
                             ];
    [apps setObject:iOS forKey:@"iOS"];
    [apps setObject:android forKey:@"Android"];
    [apps setObject:crossPlatform forKey:@"CrossPlatform"];
    [apps setObject:windows forKey:@"Windows"];
    return apps;
}





- (NSDictionary*)mainCollectionData
{
    NSMutableDictionary* categories = [NSMutableDictionary new];
    //Android
    NSMutableArray* android = [NSMutableArray new];
    NSMutableDictionary* androidItem1 = [NSMutableDictionary new];
    [androidItem1 setObject:@"android1.png" forKey:@"iconImage"];
    [androidItem1 setObject:@"AppAndroid1" forKey:@"appName"];
    [androidItem1 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem1 setObject:@"1/1/2015" forKey:@"releaseDate"];
        [androidItem1 setObject:@"Zurich" forKey:@"partner"];
    [androidItem1 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* androidItem2 = [NSMutableDictionary new];
    [androidItem2 setObject:@"android2.png" forKey:@"iconImage"];
    [androidItem2 setObject:@"AppAndroid2" forKey:@"appName"];
    [androidItem2 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem2 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem2 setObject:@"Emirates" forKey:@"partner"];

    [androidItem2 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* androidItem3 = [NSMutableDictionary new];
    [androidItem3 setObject:@"android3.png" forKey:@"iconImage"];
    [androidItem3 setObject:@"AppAndroid3" forKey:@"appName"];
    [androidItem3 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem3 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem3 setObject:@"MOH RIS" forKey:@"partner"];

    [androidItem3 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* androidItem4 = [NSMutableDictionary new];
    [androidItem4 setObject:@"android4.png" forKey:@"iconImage"];
    [androidItem4 setObject:@"AppAndroid4" forKey:@"appName"];
    [androidItem4 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem4 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem4 setObject:@"CSCV" forKey:@"partner"];

    [androidItem4 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* androidItem5 = [NSMutableDictionary new];
    [androidItem5 setObject:@"android5.png" forKey:@"iconImage"];
    [androidItem5 setObject:@"AppAndroid5" forKey:@"appName"];
    [androidItem5 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem5 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem5 setObject:@"Zurich" forKey:@"partner"];

    [androidItem5 setObject:@"link" forKey:@"extensionLink"];
    NSMutableDictionary* androidItem6 = [NSMutableDictionary new];
    [androidItem6 setObject:@"android1.png" forKey:@"iconImage"];
    [androidItem6 setObject:@"AppAndroid1" forKey:@"appName"];
    [androidItem6 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem6 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem6 setObject:@"Air ASIA" forKey:@"partner"];

    [androidItem6 setObject:@"link" forKey:@"extensionLink"];
    
    NSMutableDictionary* androidItem7 = [NSMutableDictionary new];
    [androidItem7 setObject:@"android2.png" forKey:@"iconImage"];
    [androidItem7 setObject:@"AppAndroid2" forKey:@"appName"];
    [androidItem7 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem7 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem7 setObject:@"THP" forKey:@"partner"];

    [androidItem7 setObject:@"link" forKey:@"extensionLink"];
    
    NSMutableDictionary* androidItem8 = [NSMutableDictionary new];
    [androidItem8 setObject:@"android3.png" forKey:@"iconImage"];
    [androidItem8 setObject:@"AppAndroid3" forKey:@"appName"];
    [androidItem8 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem8 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem8 setObject:@"Vinamilk" forKey:@"partner"];

    [androidItem8 setObject:@"link" forKey:@"extensionLink"];
    
    NSMutableDictionary* androidItem9 = [NSMutableDictionary new];
    [androidItem9 setObject:@"android4.png" forKey:@"iconImage"];
    [androidItem9 setObject:@"AppAndroid4" forKey:@"appName"];
    [androidItem9 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem9 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem9 setObject:@"WA Police" forKey:@"partner"];

    [androidItem9 setObject:@"link" forKey:@"extensionLink"];
    
    NSMutableDictionary* androidItem10 = [NSMutableDictionary new];
    [androidItem10 setObject:@"android5.png" forKey:@"iconImage"];
    [androidItem10 setObject:@"AppAndroid5" forKey:@"appName"];
    [androidItem10 setObject:@"Android" forKey:@"Catelogy"];
    [androidItem10 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [androidItem10 setObject:@"Zurich" forKey:@"partner"];

    [androidItem10 setObject:@"link" forKey:@"extensionLink"];
    
    [android addObject:androidItem1];
    [android addObject:androidItem2];
    [android addObject:androidItem3];
    [android addObject:androidItem4];
    [android addObject:androidItem5];
    [android addObject:androidItem6];
    [android addObject:androidItem7];
    [android addObject:androidItem8];
    [android addObject:androidItem9];
    [android addObject:androidItem10];
    [categories setObject:android forKey:@"Android"];
    [categories setObject:android forKey:@"Android1"];
    [categories setObject:android forKey:@"Android2"];

    
    //iOS
    NSMutableArray* iOS = [NSMutableArray new];
    NSMutableDictionary* iOSItem1 = [NSMutableDictionary new];
    [iOSItem1 setObject:@"iOS1.png" forKey:@"iconImage"];
    [iOSItem1 setObject:@"AppiOS1" forKey:@"appName"];
    [iOSItem1 setObject:@"iOS" forKey:@"Catelogy"];
    [iOSItem1 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [iOSItem1 setObject:@"Zurich" forKey:@"partner"];

    [iOSItem1 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* iOSItem2 = [NSMutableDictionary new];
    [iOSItem2 setObject:@"iOS2.png" forKey:@"iconImage"];
    [iOSItem2 setObject:@"AppiOS2" forKey:@"appName"];
    [iOSItem2 setObject:@"iOS" forKey:@"Catelogy"];
    [iOSItem2 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [iOSItem2 setObject:@"Emirates" forKey:@"partner"];

    [iOSItem2 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* iOSItem3 = [NSMutableDictionary new];
    [iOSItem3 setObject:@"iOS3.png" forKey:@"iconImage"];
    [iOSItem3 setObject:@"AppiOS3" forKey:@"appName"];
    [iOSItem3 setObject:@"iOS" forKey:@"Catelogy"];
    [iOSItem3 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [iOSItem3 setObject:@"Emirates" forKey:@"partner"];

    [iOSItem3 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* iOSItem4 = [NSMutableDictionary new];
    [iOSItem4 setObject:@"iOS4.png" forKey:@"iconImage"];
    [iOSItem4 setObject:@"AppiOS4" forKey:@"appName"];
    [iOSItem4 setObject:@"iOS" forKey:@"Catelogy"];
    [iOSItem4 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [iOSItem4 setObject:@"WA Police" forKey:@"partner"];

    [iOSItem4 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* iOSItem5 = [NSMutableDictionary new];
    [iOSItem5 setObject:@"iOS5.png" forKey:@"iconImage"];
    [iOSItem5 setObject:@"AppiOS5" forKey:@"appName"];
    [iOSItem5 setObject:@"iOS" forKey:@"Catelogy"];
    [iOSItem5 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [iOSItem5 setObject:@"MOH RIS" forKey:@"partner"];

    [iOSItem5 setObject:@"link" forKey:@"extensionLink"];

    [iOS addObject:iOSItem1];
    [iOS addObject:iOSItem2];
    [iOS addObject:iOSItem3];
    [iOS addObject:iOSItem4];
    [iOS addObject:iOSItem5];
    [categories setObject:iOS forKey:@"iOS"];
    [categories setObject:iOS forKey:@"iOS2"];
    [categories setObject:iOS forKey:@"iOS3"];

    //CrossPlatform
    NSMutableArray* crossPlatForm = [NSMutableArray new];
    NSMutableDictionary* crossPlatFormItem1 = [NSMutableDictionary new];
    [crossPlatFormItem1 setObject:@"crossPlatForm1.png" forKey:@"iconImage"];
    [crossPlatFormItem1 setObject:@"AppCrossPlatForm1" forKey:@"appName"];
    [crossPlatFormItem1 setObject:@"crossPlatForm" forKey:@"Catelogy"];
    [crossPlatFormItem1 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [crossPlatFormItem1 setObject:@"Emirates" forKey:@"partner"];

    [crossPlatFormItem1 setObject:@"link" forKey:@"extensionLink"];

    NSMutableDictionary* crossPlatFormItem2 = [NSMutableDictionary new];
    [crossPlatFormItem2 setObject:@"crossPlatForm2.png" forKey:@"iconImage"];
    [crossPlatFormItem2 setObject:@"AppCrossPlatForm2" forKey:@"appName"];
    [crossPlatFormItem2 setObject:@"crossPlatForm" forKey:@"Catelogy"];
    [crossPlatFormItem2 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [crossPlatFormItem2 setObject:@"VinaMilk" forKey:@"partner"];

    [crossPlatFormItem2 setObject:@"link" forKey:@"extensionLink"];
    NSMutableDictionary* crossPlatFormItem3 = [NSMutableDictionary new];
    [crossPlatFormItem3 setObject:@"crossPlatForm3.png" forKey:@"iconImage"];
    [crossPlatFormItem3 setObject:@"AppCrossPlatForm3" forKey:@"appName"];
    [crossPlatFormItem3 setObject:@"crossPlatForm" forKey:@"Catelogy"];
    [crossPlatFormItem3 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [crossPlatFormItem3 setObject:@"THP" forKey:@"partner"];

    [crossPlatFormItem3 setObject:@"link" forKey:@"extensionLink"];
    NSMutableDictionary* crossPlatFormItem4 = [NSMutableDictionary new];
    [crossPlatFormItem4 setObject:@"crossPlatForm4.png" forKey:@"iconImage"];
    [crossPlatFormItem4 setObject:@"AppcrossPlatForm4" forKey:@"appName"];
    [crossPlatFormItem4 setObject:@"crossPlatForm" forKey:@"Catelogy"];
    [crossPlatFormItem4 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [crossPlatFormItem4 setObject:@"ABC Inc" forKey:@"partner"];

    [crossPlatFormItem4 setObject:@"link" forKey:@"extensionLink"];
    NSMutableDictionary* crossPlatFormItem5 = [NSMutableDictionary new];
    [crossPlatFormItem5 setObject:@"crossPlatForm5.png" forKey:@"iconImage"];
    [crossPlatFormItem5 setObject:@"AppCrossPlatForm5" forKey:@"appName"];
    [crossPlatFormItem5 setObject:@"crossPlatForm" forKey:@"Catelogy"];
    [crossPlatFormItem5 setObject:@"1/1/2015" forKey:@"releaseDate"];
    [crossPlatFormItem5 setObject:@"XYZ Cop" forKey:@"partner"];

    [crossPlatFormItem5 setObject:@"link" forKey:@"extensionLink"];
    [crossPlatForm addObject:crossPlatFormItem1];
    [crossPlatForm addObject:crossPlatFormItem2];
    [crossPlatForm addObject:crossPlatFormItem3];
    [crossPlatForm addObject:crossPlatFormItem4];
    [crossPlatForm addObject:crossPlatFormItem5];
    [categories setObject:crossPlatForm forKey:@"crossPlatForm"];
    [categories setObject:crossPlatForm forKey:@"crossPlatForm1"];

    [categories setObject:crossPlatForm forKey:@"crossPlatForm2"];

    
    return categories;
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
                            @"description":@"Chinh is a ABCXYZ bla-bla Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in repreheenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
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
