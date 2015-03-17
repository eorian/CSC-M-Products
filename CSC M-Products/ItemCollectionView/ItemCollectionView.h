//
//  ItemCollectionView.h
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollectionView : UIView
@property (weak, nonatomic) IBOutlet UILabel *rowHeaderTitle;
- (IBAction)seeAllButton:(id)sender;

- (void)setCollectionData:(NSArray*)collectionArray;

@end
