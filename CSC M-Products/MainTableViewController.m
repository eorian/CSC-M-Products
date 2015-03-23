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
@property (nonatomic, strong) NSMutableArray* headerArray;
@property (nonatomic, strong) UIScrollView* headerScrollView;

@end

@implementation MainTableViewController
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionData = [self fakeData];
    self.collectionDataKeys = [NSMutableArray arrayWithArray:[[self fakeData]allKeys]];
    self.title = @"Featured";
    [GlobalData sharedManager].navigationController = self.navigationController;
    [self.tableView registerClass:[MainTableViewCell class] forCellReuseIdentifier:@"MainTableViewCell"];
    [self addHeaderView];
    //[NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(onTimer)   userInfo:nil repeats:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    

}
- (void)onTimer
{
    float h = self.headerScrollView.contentOffset.x + 320;
    [self.headerScrollView setContentOffset:CGPointMake(h, 0) animated:YES];
    [self scrollViewDidEndDecelerating:self.headerScrollView];
}
- (void)addHeaderView
{
    JsonHelper * helper = [JsonHelper new];
    NSArray* originalArray = [helper headerData];
    id firstItem = [originalArray firstObject];
    id lastItem = [originalArray lastObject];
    self.headerArray = [NSMutableArray arrayWithArray:originalArray];
    [self.headerArray addObject:firstItem];
    [self.headerArray insertObject:lastItem atIndex:0];
    self.headerScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    self.headerScrollView.tag = 1001;
    self.headerScrollView.delegate = self;
    self.headerScrollView.pagingEnabled = YES;
    self.headerScrollView.showsHorizontalScrollIndicator = NO;
    self.headerScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, 200);
    for (int i = 0; i < self.headerArray.count; i++) {
        CGRect imageFrame = CGRectMake(i*320, 0, 320, 200);
        UIImageView* header= [[UIImageView alloc]initWithFrame:imageFrame];
        CGFloat redLevel    = rand() / (float) RAND_MAX;
        CGFloat greenLevel  = rand() / (float) RAND_MAX;
        CGFloat blueLevel   = rand() / (float) RAND_MAX;
        
        header.backgroundColor = [UIColor colorWithRed: redLevel
                                                 green: greenLevel
                                                  blue: blueLevel
                                                 alpha: 1.0];
        header.image = [UIImage imageNamed:[self.headerArray objectAtIndex:i]];
        self.headerScrollView.contentOffset = CGPointMake(320/2 + (self.view.bounds.size.width -320)/2, 0);
        [self.headerScrollView addSubview:header];
    }
    
    UIView* headerSectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,200-66)];
    headerSectionView.backgroundColor   = [UIColor whiteColor];
    UIView* contentView = self.headerScrollView;
    contentView.backgroundColor = [UIColor whiteColor];
    [headerSectionView  addSubview:contentView];
    self.tableView.tableHeaderView = headerSectionView;
   
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
    NSString*jsonString = [helper JSONwithDictionary:[helper mainCollectionData]];
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //stick header
    NSLog([NSString stringWithFormat:@"%f",scrollView.contentOffset.x]);
    if (scrollView.tag == 1001) {
       
        if (scrollView.contentOffset.x == (self.headerArray.count-1)*320) {
            scrollView.contentOffset = CGPointMake(320, 0);
        }
        else if(scrollView.contentOffset.x == 0)
        {
            scrollView.contentOffset = CGPointMake((self.headerArray.count - 2)*320,0);
        }
        

    }else
    {
        CGFloat offsetY = scrollView.contentOffset.y;
        UIView *headerContentView = self.tableView.tableHeaderView.subviews[0];
        headerContentView.transform = CGAffineTransformMakeTranslation(0, MIN(offsetY, 0));
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //circul scrollView
    
}
@end
