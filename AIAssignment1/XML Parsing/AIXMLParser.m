//
//  AIXMLParser.m
//  AIAssignment1
//
//  Created by Jonathan Howard on 2/21/14.
//  Copyright (c) 2014 Jonathan Howard. All rights reserved.
//

#import "AIXMLParser.h"

@implementation AIXMLParser

+ (NSString *)findValueFrom:(NSString *)string andKey:(NSString *)key {
    NSInteger left, right;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSString *fKey = [NSString stringWithFormat:@"%@=\"", key];
    
    if(![scanner scanUpToString:fKey intoString:nil]) return nil;
    left = [scanner scanLocation];
    if(string.length == left) return nil;
    
    [scanner setScanLocation:left+fKey.length];
    
    [scanner scanUpToString:@"\"" intoString:nil];
    right = [scanner scanLocation] + 1;
    
    NSString *data = [string substringWithRange: NSMakeRange(left + fKey.length, (right - fKey.length - left - 1))];
    NSLog(@"token: %@", data);

    return data;
}

+ (NSMutableDictionary *)parseXMLTreeFromString:(NSString *)string {
    NSInteger left, right;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    NSMutableArray *stack = [[NSMutableArray alloc] init];
    
    while (true) {
        [scanner scanUpToString:@"<" intoString:nil];
        left = [scanner scanLocation];
        [scanner scanUpToString:@">" intoString:nil];
        right = [scanner scanLocation] + 1;

        if([scanner isAtEnd]) break;
        
        NSString *data = [string substringWithRange: NSMakeRange(left, (right - left))];
        NSLog(@"%@", data);
        
        if([[data substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"</"]) {
            NSMutableDictionary *obj = [stack lastObject];
            [stack removeLastObject];
            if (stack.count == 0) return obj;
            continue;
        }
        
        NSMutableDictionary *d = [[NSMutableDictionary alloc] init];
        
        [d setValue:[self findValueFrom:data andKey:@"behavior"] forKey:@"behavior"];
        [d setValue:[self findValueFrom:data andKey:@"response"] forKey:@"response"];
        
        [d setValue:[[NSMutableArray alloc] init] forKey:@"children"];
        [[[stack lastObject] objectForKey:@"children"] addObject:d];
        
        if(![[data substringWithRange:NSMakeRange(data.length-2, 2)] isEqualToString:@"/>"])
            [stack addObject:d];
    }
    return nil;
}

@end