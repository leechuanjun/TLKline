//
//  UIColor+Tridon.h
//  TLKline
//
//  Created by lichuanjun on 15/9/26.
//  Copyright © 2015年 lichuanjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLColorModel.h"

@interface UIColor (Tridon)

+ (UIColor *) colorWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;
+ (TLColorModel *) RGBWithHexString: (NSString *)color withAlpha:(CGFloat)alpha;

@end
