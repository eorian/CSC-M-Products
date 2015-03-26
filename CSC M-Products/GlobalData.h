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
    NSMutableArray* description;
}

@property (nonatomic, strong) NSMutableDictionary* offsets;
@property (nonatomic,strong) UINavigationController* navigationController;
@property (nonatomic,strong) NSMutableArray* description;

/*dictionary info for descriotionSection
 ---------------------array item
 "tableViewCellStyle": "Imageview" ->enum in constant.h
 "Images": "ImageArray"
 ---------------------arrayitem
 "tableViewCellStyle": "plainText" ->Enum
 "title": "String"
 "text" : "String"
 ---------------------
*/
+ (GlobalData*)sharedManager;

@end
