//
//  UIApplication+UserNotificaitonHelper.h

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
@interface UIApplication (UserNotificaitonHelper)

- (void)registerUserNotificationWithDelegate:(id <UNUserNotificationCenterDelegate>)delegate;

@end
