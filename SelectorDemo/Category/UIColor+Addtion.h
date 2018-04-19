//
//  UIColor+Addtion.h

#import <UIKit/UIKit.h>

@interface UIColor (Addtion)

+ (UIColor *)pc_colorWithHex:(NSInteger)hex;

+ (UIColor *)pc_colorWithHex:(NSInteger)hex alpha:(CGFloat)alpha;

+ (UIColor *)pc_colorWithHexString:(NSString *)color;

+ (UIColor *)pc_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
