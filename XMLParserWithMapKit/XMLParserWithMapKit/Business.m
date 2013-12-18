//
//  Business.m
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import "Business.h"

@implementation Business
@synthesize strName = _strName,
            strCategory = _strCategory,
            strPhone = _strPhone;
@synthesize nRatings = _nRatings;
@synthesize location = _location;

- (Business*)initBusinessWithName:(NSString*)name
                         category:(NSString*)category
                           rating:(int)rating
                         location:(Location*)loc
                            phone:(NSString*)phone{
    if (self = [super init]) {
        _strName = name;
        _strCategory = category;
        _nRatings = rating;
        _location = loc;
        _strPhone = phone;
    }
    return self;
}
@end
