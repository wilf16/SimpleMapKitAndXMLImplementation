//
//  Business.h
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Location;
@interface Business : NSObject

@property (nonatomic,retain) NSString * strName;
@property (nonatomic,retain) NSString * strCategory;
@property (nonatomic, assign) int nRatings;
@property (nonatomic,retain) Location * location;
@property (nonatomic,retain) NSString * strPhone;

- (Business*)initBusinessWithName:(NSString*)name category:(NSString*)category rating:(int)rating location:(Location*)loc phone:(NSString*)phone;
@end
