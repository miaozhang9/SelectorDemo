//
//  UIFont+Addtion.m
//  GammRayFilters
//


#import "UIFont+Addtion.h"

@implementation UIFont (Addtion)

+ (UIFont *)pingFangSCMediumWithSize:(CGFloat)size  {
    CGFloat phoneVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (phoneVersion >= 9.0) {
        return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
    }
    return [UIFont systemFontOfSize:size];
}

+ (UIFont *)pingFangSCRegularWithSize:(CGFloat)size {
    CGFloat phoneVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (phoneVersion >= 9.0) {
        return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
    }
    return [UIFont systemFontOfSize:size];
}

@end
