//
//  BusinessXMLParser.h
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Business;
@interface BusinessXMLParser : NSObject

+ (NSString*)saveXMLData:(NSData*)xmlData;

+ (Business*)loadBusinessFromFilePath:(NSString*)filePath;
@end
