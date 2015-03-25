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
    NSMutableDictionary* description;
}

@property (nonatomic, strong) NSMutableDictionary* offsets;
@property (nonatomic,strong) UINavigationController* navigationController;
@property (nonatomic,strong) NSMutableDictionary* description;

/*dictionary info for descriotionSection
 ---------------------object for key descriptionImages
 "tableViewCellStyle": "Imageview" ->enum in constant.h
 "Images": "ImageArray"
 ---------------------object for key descriptionText
 "tableViewCellStyle": "plainText" ->Enum
 "title": "String"
 "text" : "String"
 ---------------------
*/
+ (GlobalData*)sharedManager;

@end
