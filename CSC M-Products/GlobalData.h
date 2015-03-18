//
//  GlobalData.h
//  CSC M-Products
//
//  Created by namle on 3/18/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalData : NSObject
{
    
    NSMutableDictionary *offsets;
}

@property (nonatomic, strong) NSMutableDictionary* offsets;

+ (GlobalData*)sharedManager;

@end
