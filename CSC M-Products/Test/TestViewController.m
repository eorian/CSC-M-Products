//
//  TestViewController.m
//  CSC M-Products
//
//  Created by namle on 3/19/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIGestureRecognizerDelegate >
{
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+150);
    self.tableView.delegate = self;
    self.tableView.scrollEnabled = YES;
    self.scrollView.bounces = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //self.tableView.contentOffset = self.scrollView.contentOffset;
}
- (BOOL)gestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UISwipeGestureRecognizer*)otherGestureRecognizer
{
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]) {
        return YES;
    }
    return NO;
}

@end
