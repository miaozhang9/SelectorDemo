//
//  ACChoiceAppointTimeViewController.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/10.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import "ViewController.h"

#import "ACAvailableListDTO.h"

typedef void(^AppointTimeRefreshComplete)(ACAvailableListDTO *listDto, NSInteger dayIndex);

@protocol PCChoiceAppointTimeDelegate <NSObject>

@required
/**
 确定选中预约日期后的回调
 @param appointDate 预约日期
 @param availableDTO 预约时间段相应的model
 */
- (void)confirmChoiceAppointTime:(NSString *)appointDate availableDTO:(ACAvailableDTO*)availableDTO;

@optional
/**
 点击某一个日期后，供外界刷新数据，实现该代理时一定要调用block  complete
 
 @param dayIndex 当前选中的某一天，可作为AppointTimeRefreshComplete的入参
 @param complete 外界刷新数据后调用该block完成页面的刷新
 */
- (void)refreshChoiceAppointTimeWithDayIndex:(NSInteger)dayIndex Complete:(AppointTimeRefreshComplete)complete;

@end

@interface ACChoiceAppointTimeViewController : ViewController

// controller 初始化方法
- (instancetype)initWithAppointTimeDelegate:(id<PCChoiceAppointTimeDelegate>)delegate;

// 更新数据
- (void)updateDataSource:(ACAvailableListDTO *)listDto;

// present选择器
- (void)presentAppointTimeViewWithController:(UIViewController *)viewController;

// dismiss选择器
- (void)dismissAppointTimeView;

@end

