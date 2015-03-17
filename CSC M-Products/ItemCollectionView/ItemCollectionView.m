//
//  ItemCollectionView.m
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ItemCollectionView.h"
#import "ItemCollectionViewCell.h"

@interface ItemCollectionView()<UICollectionViewDataSource,UICollectionViewDelegate>
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
    collectionFlowLayout.itemSize = CGSizeMake(90, 150);
    [self.collectionView setCollectionViewLayout:collectionFlowLayout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ItemCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ItemCollectionViewCell"];
    
}
#pragma mark    set CollectionView Data
- (IBAction)seeAllButton:(id)sender {
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


@end
