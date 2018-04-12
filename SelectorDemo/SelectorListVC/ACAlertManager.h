//
//  ACAlertManager.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ActionBlock)(void);

@interface ACAlertManager : NSObject

@property (nonatomic, strong) UIViewController *viewController;

+ (instancetype)shareAlertManager;

- (void)showAlertMessageWithContent:(NSString *)content;

- (void)showAlertMessageWithOneContent:(NSString *)content actiontitle:(NSString *)title okeyAction:(ActionBlock)okeyAction;

- (void)showAlertMessageWithContent:(NSString *)content okeyAction:(ActionBlock)okeyAction cancelAction:(ActionBlock)cancelAction;

- (void)showAlertMessageWithTitle:(NSString *)title content:(NSString *)content okeyTitle:(NSString *)okeyTitle okeyAction:(ActionBlock)okeyAction cancelTitle:(NSString *)cancelTitle cancelAction:(ActionBlock)cancelAction;

@end
