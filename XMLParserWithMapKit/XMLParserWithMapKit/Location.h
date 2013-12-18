//
//  Location.h
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic,retain) NSString * strAddress;
@property (nonatomic,retain) NSString * strCity;
@property (nonatomic,retain) NSString * strState;
@property (nonatomic,retain) NSString * strZipCode;
@property (nonatomic,assign) double dLatitude;
@property (nonatomic,assign) double dLongitude;

- (Location*)initLocationWithAddress:(NSString*)address
                                city:(NSString*)city
                               state:(NSString*)state
                             zipCode:(NSString*)zipCode
                            latitude:(double)latitude
                           longitude:(double)longitude;
@end
