//
//  BusinessXMLParser.m
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import "BusinessXMLParser.h"
#import "Business.h"
#import "Location.h"
#import "GDataXMLNode.h"
@implementation BusinessXMLParser

+ (NSString*)saveXMLData:(NSData*)xmlData{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"business.xml"];
    
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    [xmlData writeToFile:path atomically:YES];
    return path;
}

+ (Business*)loadBusinessFromFilePath:(NSString*)filePath{
    NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filePath];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
                                                           options:0 error:&error];
    if (doc == nil) { return nil; }
    
    NSLog(@"%@", doc.rootElement);
    
    NSArray * locationContents = [doc.rootElement elementsForName:@"location"];
    NSString * address = [self elementFromArray:locationContents withKey:@"address"];
    NSString * city = [self elementFromArray:locationContents withKey:@"city"];
    NSString * state = [self elementFromArray:locationContents withKey:@"state"];
    NSString * zipCode = [self elementFromArray:locationContents withKey:@"zip"];
    double latitude = [[self elementFromArray:locationContents withKey:@"latitude"] doubleValue];
    double longitude = [[self elementFromArray:locationContents withKey:@"longitude"] doubleValue];
    Location * location = [[Location alloc] initLocationWithAddress:address city:city state:state zipCode:zipCode latitude:latitude longitude:longitude];
    
    NSString * name = [self elementFromXMLDoc:doc withKey:@"name"];
    NSString * category = [self elementFromXMLDoc:doc withKey:@"category"];
    int rating = [[self elementFromXMLDoc:doc withKey:@"rating"] intValue];
    NSString * phone = [self elementFromXMLDoc:doc withKey:@"phone"];
    Business * business = [[Business alloc] initBusinessWithName:name category:category rating:rating location:location phone:phone];
    
    return business;
}

+ (NSString*)elementFromArray:(NSArray*)array withKey:(NSString*)key{
    NSString * string;
    GDataXMLElement *xmlElement = (GDataXMLElement*)array[0];
    NSArray *elements = [xmlElement elementsForName:key];
    if (elements.count > 0) {
        GDataXMLElement *element = (GDataXMLElement *) [elements objectAtIndex:0];
        string = element.stringValue;
    }
    return string;
}

+ (NSString*)elementFromXMLDoc:(GDataXMLDocument*)doc withKey:(NSString*)key{
    return [[[doc.rootElement elementsForName:key] objectAtIndex:0] stringValue];
}
@end
