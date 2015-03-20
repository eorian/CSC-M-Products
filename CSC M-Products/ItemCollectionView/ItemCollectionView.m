//
//  ItemCollectionView.m
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ItemCollectionView.h"
#import "ItemCollectionViewCell.h"
#import "MainTableViewCell.h"
#import "GlobalData.h"
#import "ListItemTableViewController.h"
#import "MainTableViewController.h"
@interface ItemCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray* collectionArray;
@end

@implementation ItemCollectionView

- (void)awakeFromNib
{
    //setup Collection
    self.collectionView.backgroundColor= [UIColor whiteColor];
    UICollectionViewFlowLayout * collectionFlowLayout = [UICollectionViewFlowLayout new];
    collectionFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    collectionFlowLayout.itemSize = CGSizeMake(80, 160);
    
    [self.collectionView setCollectionViewLayout:collectionFlowLayout];
    [self.collectionView setPagingEnabled:YES];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCollectionViewCell"];
    
}
#pragma mark    set CollectionView Data
- (IBAction)seeAllButton:(id)sender {
    //push seeall tableview controller
    
    //prepareData
    ListItemTableViewController* controller = [ListItemTableViewController new];
    controller.data = self.collectionArray;
    [[GlobalData sharedManager].navigationController pushViewController:controller animated:YES];
    ListItemTableViewController* listItemViewController = [[[GlobalData sharedManager].navigationController viewControllers] lastObject];
    listItemViewController.title = [((MainTableViewController*)[[[GlobalData sharedManager].navigationController viewControllers] firstObject]).collectionDataKeys objectAtIndex:self.cellIndex];
}

- (void)setCollectionData:(NSArray *)collectionArray{
    self.collectionArray  = collectionArray;
    [self.collectionView setContentOffset:CGPointZero animated:NO];
    [self.collectionView reloadData];
}




#pragma mark UICollectionView Data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.collectionArray count];
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary* itemDic = [self.collectionArray objectAtIndex:indexPath.row];
    ItemCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemCollectionViewCell" forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage imageNamed:[itemDic objectForKey:@"iconImage"]];
    cell.appNameLabel.text = [itemDic objectForKey:@"appName"];
    cell.categoryNameLabel.text = [itemDic objectForKey:@"Catelogy"];
    cell.releaseDateLabel.text = [itemDic objectForKey:@"releaseDate"];
    
    cell.itemindex = indexPath.row;
    return cell;
                                
}
#pragma mark UIScrollview delegate
- (void)setCollectionViewContenOffset:(CGPoint)point;
{
    [self.collectionView setContentOffset:point animated:NO];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    if (point.x == 0) {
        return;
    }
    NSString* key = [ NSString stringWithFormat:@"index%d",self.cellIndex];
    [[GlobalData sharedManager].offsets setObject:[NSNumber numberWithFloat:point.x] forKey:key];
}

@end
