//
//  JsonHelper.m
//  CSC M-Products
//
//  Created by namle on 3/16/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "JsonHelper.h"

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
@end
