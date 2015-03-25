//
//  ImageViewController.h
//  CSC M-Products
//
//  Created by namle on 3/25/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagePageViewController : UIViewController<UIPageViewControllerDataSource>
@property (strong, nonatomic) UIPageViewController *pageController;
@property (nonatomic, strong) NSArray* data;
@property (nonatomic) int selectedIndex;
@property (nonatomic) NSUInteger index;
@end
