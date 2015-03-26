//
//  TeamMemberTableViewCell.h
//  CSC M-Products
//
//  Created by namle on 3/26/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamMemberTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *memberImageView;
@property (weak, nonatomic) IBOutlet UILabel *memberNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *memberTitle;

@end
