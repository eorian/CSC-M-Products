//
//  MainTableViewCell.h
//  CSC M-Products
//
//  Created by namle on 3/17/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
- (void)setCollectionData:(NSArray*)collectionArray;
- (void)setHeaderTitle:(NSString*)title;
- (void)setCellIndex:(int)index;
- (void)setCollectionViewContenOffset:(CGPoint)point;

@end
