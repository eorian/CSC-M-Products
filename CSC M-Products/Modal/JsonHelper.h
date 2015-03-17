//
//  JsonHelper.h
//  CSC M-Products
//
//  Created by namle on 3/16/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonHelper : NSObject

- (NSString*)JSONwithDictionary:(NSDictionary*)dictionary;
- (NSDictionary*)data;
- (NSDictionary*)dictionaryWithJSONString:(NSString*)JSONString;

@end
