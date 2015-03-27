//
//  ItemDetailTableViewController.h
//  CSC M-Products
//
//  Created by namle on 3/24/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemDetailTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableDictionary* data;
@property (nonatomic,strong) NSArray* contentCells;
@end
