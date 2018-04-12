//
//  ACAppointSelectorDelegate.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACAvailableListDTO.h"

@protocol ACAppointSelectorProtocol <NSObject>

@required
/**
 确定选中预约日期后的回调
 @param availableDayDTO 预约日期实例
 @param availableDTO 预约当日时间段实例
 */
- (void)confirmAppointSelectTime:(ACAvailableDayDTO *)availableDayDTO availableDTO:(ACAvailableDTO*)availableDTO;

@end

