//
//  MemberDetailViewController.h
//  CSC M-Products
//
//  Created by namle on 3/26/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemberDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *memberImage;
@property (weak, nonatomic) IBOutlet UILabel *memberName;
@property (weak, nonatomic) IBOutlet UILabel *memberPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *memberEmail;
@property (weak, nonatomic) IBOutlet UILabel *memberAddress;
@property (weak, nonatomic) IBOutlet UILabel *memberCompany;
@property (weak, nonatomic) IBOutlet UITextView *memberDescription;

@property (nonatomic, strong)NSDictionary* data;

@end
