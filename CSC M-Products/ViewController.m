//
//  ViewController.m
//  CSC M-Products
//
//  Created by namle on 3/16/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ViewController.h"
#import "JsonHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary* data = [self fakeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark Init Fakedata
- (NSDictionary*)fakeData
{
    JsonHelper* helper = [JsonHelper new];
    NSString*jsonString = [helper JSONwithDictionary:[helper mainCollectionData]];
    NSDictionary* data = [helper dictionaryWithJSONString:jsonString];
    return data;

}




@end
