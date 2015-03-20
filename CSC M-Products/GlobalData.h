//
//  GlobalData.h
//  CSC M-Products
//
//  Created by namle on 3/18/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GlobalData : NSObject
{
    NSMutableDictionary* offsets;

}

@property (nonatomic, strong) NSMutableDictionary* offsets;
@property (nonatomic,strong) UINavigationController* navigationController;
+ (GlobalData*)sharedManager;

@end
