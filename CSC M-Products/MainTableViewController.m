//
//  MainTableViewController.m
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "MainTableViewController.h"
#import "MainTableViewCell.h"
#import "JsonHelper.h"
#import "GlobalData.h"
@interface MainTableViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSDictionary* collectionData;
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionData = [self fakeData];
    self.collectionDataKeys = [NSMutableArray arrayWithArray:[[self fakeData]allKeys]];
    self.title = @"Featured";
    [GlobalData sharedManager].navigationController = self.navigationController;
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"MainTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.collectionDataKeys count];;
}
#pragma mark Init Fakedata
- (NSDictionary*)fakeData
{
    JsonHelper* helper = [JsonHelper new];
    NSString*jsonString = [helper JSONwithDictionary:[helper data]];
    NSDictionary* data = [helper dictionaryWithJSONString:jsonString];
    return data;
    
}
#pragma mark table View Delegate Datasource

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
    NSMutableArray* cellData = [NSMutableArray new];
    cellData = [self.collectionData objectForKey:[self.collectionDataKeys objectAtIndex:indexPath.row]];
    [cell setCollectionData:cellData];
    [cell setHeaderTitle:[self.collectionDataKeys objectAtIndex:indexPath.row]];
    [cell setCellIndex:(int)indexPath.row];
        NSString* key = [ NSString stringWithFormat:@"index%d",(int)indexPath.row];
    
        if ([[GlobalData sharedManager].offsets objectForKey:key])
        {
            
            CGPoint offsetPoint = CGPointMake([[[GlobalData sharedManager].offsets objectForKey:key] doubleValue], 0);
            [cell  setCollectionViewContenOffset:offsetPoint];
        }

    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 195;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
