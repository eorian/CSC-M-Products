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
#import "InfinitePagingView.h"
@interface MainTableViewController ()<UIScrollViewDelegate,InfinitePagingViewDelegate>
@property (nonatomic, strong) NSDictionary* collectionData;
@property (nonatomic, strong) NSMutableArray* headerArray;
@property (nonatomic, strong) UIScrollView* headerScrollView;

@end

@implementation MainTableViewController
{
    InfinitePagingView* headerview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tag = 1000;
    self.collectionData = [self fakeData];
    self.collectionDataKeys = [NSMutableArray arrayWithArray:[[self fakeData]allKeys]];
    self.title = @"Featured";
    [GlobalData sharedManager].navigationController = self.navigationController;
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"MainTableViewCell"];
    [self addHeaderView];
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(onTimer)   userInfo:nil repeats:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;

}
- (void)onTimer
{
    [headerview scrollToNextPage];
}
- (void)addHeaderView
{
    JsonHelper * helper = [JsonHelper new];
    self.headerArray = [NSMutableArray arrayWithArray:[helper headerData]];
    headerview = [[InfinitePagingView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    headerview.pageSize = CGSizeMake(320, 200);
    headerview.delegate = self;
    for (int i=0; i<self.headerArray.count; i++) {
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
        imageView.image = [UIImage imageNamed:[self.headerArray objectAtIndex:i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [headerview addPageView:imageView];
    }
    UIView* contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 200)];
    [contentView addSubview:headerview];
    self.tableView.tableHeaderView = contentView;

    
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
    return helper.appData;
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

#pragma mark UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

        CGFloat offsetY = scrollView.contentOffset.y;
        UIView *headerContentView = self.tableView.tableHeaderView.subviews[0];
        headerContentView.transform = CGAffineTransformMakeTranslation(0, MIN(offsetY, 0));
}

@end
