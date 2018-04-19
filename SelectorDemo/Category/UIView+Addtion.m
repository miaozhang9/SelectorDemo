//
//  UIView+Addtion.m
#import "UIView+Addtion.h"

@implementation UIView (Addtion)

- (void)pc_removeAllSubviews {
    //[self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}

@end
