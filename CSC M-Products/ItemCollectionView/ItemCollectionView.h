//
//  ItemCollectionView.h
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollectionView : UIView
@property (nonatomic) int cellIndex;
//Outlet - Action
@property (weak, nonatomic) IBOutlet UILabel *rowHeaderTitle;
- (IBAction)seeAllButton:(id)sender;
//Method
- (void)setCollectionData:(NSArray*)collectionArray;
- (void)setCollectionViewContenOffset:(CGPoint)point;



@end
