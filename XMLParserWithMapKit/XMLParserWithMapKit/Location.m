//
//  Location.m
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import "Location.h"

@implementation Location
@synthesize strAddress = _strAddress,
            strCity = _strCity,
            strState = _strState,
            strZipCode = _strZipCode;
@synthesize dLatitude = _dLatitude,
            dLongitude = _dLongitude;

- (Location*)initLocationWithAddress:(NSString*)address
                                city:(NSString*)city
                               state:(NSString*)state
                             zipCode:(NSString*)zipCode
                            latitude:(double)latitude
                           longitude:(double)longitude{
    if (self = [super init]) {
        _strAddress = address;
        _strCity = city;
        _strState = state;
        _strZipCode = zipCode;
        _dLatitude = latitude;
        _dLongitude = longitude;
    }
    return self;
}
@end
