//
//  ImageChildViewController.h
//  CSC M-Products
//
//  Created by namle on 3/25/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageChildViewController : UIPageViewController
@property (nonatomic) NSUInteger index;
@property (nonatomic, strong)UIImageView *imageView;
@end
