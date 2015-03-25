//
//  ImageChildViewController.m
//  CSC M-Products
//
//  Created by namle on 3/25/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ImageChildViewController.h"

@interface ImageChildViewController ()

@end

@implementation ImageChildViewController
- (id)init
{
    if (self = [super init]) {
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0 , self.view.bounds.size.width, self.view.bounds.size.height - 130)];
        self.imageView.center = self.view.center;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:self.imageView];
    }
    return self;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
