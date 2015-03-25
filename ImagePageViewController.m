//
//  ImageViewController.m
//  CSC M-Products
//
//  Created by namle on 3/25/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ImagePageViewController.h"
#import "ImageChildViewController.h"
@interface ImagePageViewController ()

@end

@implementation ImagePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    
    // Do any additional setup after loading the view from its nib.
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageController.view.backgroundColor = [UIColor whiteColor];
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    ImageChildViewController  *initialViewController = [self viewControllerAtIndex:self.selectedIndex];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    self.title = @"Screenshot";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UiPageviewController Datasource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ImageChildViewController *)viewController index];
    
    
    index++;
    
    if (index == self.data.count) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [(ImageChildViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (ImageChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    ImageChildViewController *childViewController = [[ImageChildViewController alloc] init];
    childViewController.index = index;
    childViewController.imageView.image = [UIImage imageNamed:[self.data objectAtIndex:index]];
    return childViewController;
    
}
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return self.data.count;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return self.selectedIndex;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
