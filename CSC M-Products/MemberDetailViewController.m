//
//  MemberDetailViewController.m
//  CSC M-Products
//
//  Created by namle on 3/26/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "MemberDetailViewController.h"

@interface MemberDetailViewController ()

@end

@implementation MemberDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    self.memberImage.layer.cornerRadius = self.memberImage.bounds.size.width/2;
    [self.memberImage.layer setMasksToBounds:YES];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)loadData
{
    if (self.data == nil) {
        return NO;
    }
    self.memberImage.image = [UIImage imageNamed:[self.data objectForKey:@"memberImage"]];
    self.memberName.text = [self.data objectForKey:@"memberName"];
    self.memberPhoneNumber.text =[NSString stringWithFormat:@"Phone:  %@",[self.data objectForKey:@"memberPhone"]];
    self.memberEmail.text = [NSString stringWithFormat:     @"Email:  %@",[self.data objectForKey:@"memberEmail"]];
    self.memberAddress.text = [NSString stringWithFormat:   @"Address:%@",[self.data objectForKey:@"memberAddress"]];
    self.memberCompany.text = [NSString stringWithFormat:   @"Company:%@",[self.data objectForKey:@"memberCompany"]];
    self.memberDescription.text = [self.data objectForKey:  @"description"];
    return YES;
}

@end
