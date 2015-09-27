//
//  TLCommond.h
//  TLKline
//
//  Created by lichuanjun on 15/9/26.
//  Copyright © 2015年 lichuanjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TLCommond : NSObject

+(NSDate*)dateFromString:(NSString*)str;
+(NSDateComponents*)dateComponentsWithDate:(NSDate*)date;
+(bool)isEqualWithFloat:(float)f1 float2:(float)f2 absDelta:(int)absDelta;
+(NSObject *) getUserDefaults:(NSString *) name;
+(void) setUserDefaults:(NSObject *) defaults forKey:(NSString *) key;
+ (NSString *)md5HexDigest:(NSString*)password;
+(NSString*)changePrice:(CGFloat)price;

@end
