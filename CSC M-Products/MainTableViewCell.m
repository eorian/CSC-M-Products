//
//  MainTableViewCell.m
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "MainTableViewCell.h"
#import "ItemCollectionView.h"
@interface MainTableViewCell()
@property (strong, nonatomic)ItemCollectionView * itemCollectionView;
@end

@implementation MainTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _itemCollectionView = [[NSBundle mainBundle] loadNibNamed:@"ItemCollectionView" owner:self options:nil][0];
        _itemCollectionView.frame = self.bounds;
        
        [self.contentView addSubview:_itemCollectionView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setCollectionData:(NSArray *)collectionArray
{
    [self.itemCollectionView setCollectionData:collectionArray];
}
- (void)setHeaderTitle:(NSString *)title
{
    self.itemCollectionView.rowHeaderTitle.text = title;
}
- (void)setCellIndex:(int)index
{
    self.itemCollectionView.cellIndex = index;
}
- (void)setCollectionViewContenOffset:(CGPoint)point
{
    [self.itemCollectionView setCollectionViewContenOffset:point];
}
@end
