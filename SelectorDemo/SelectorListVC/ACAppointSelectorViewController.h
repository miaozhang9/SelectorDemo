//
//  ACAppointSelectorViewController.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACAvailableListDTO.h"
#import "ACAppointSelectorProtocol.h"

typedef NS_ENUM(NSUInteger, ACFaceCheckOrderAppointState) {
    ACFaceCheckOrderAppointState_isqueuing, //排队中
    ACFaceCheckOrderAppointState_queuingInother, //在其他队列中排队
    ACFaceCheckOrderAppointState_vailableInterview, //发起面签
    ACFaceCheckOrderAppointState_appointInterview, //预约面签
    ACFaceCheckOrderAppointState_overdueappoint, //预约过期 放鸽子
    ACFaceCheckOrderAppointState_appointupdate, //显示取消预约、申请改期
    ACFaceCheckOrderAppointState_appointDefault, //除了以上所有子状态的标示
};


@interface ACAppointSelectorViewController : UIViewController
@property(nonatomic, assign)ACFaceCheckOrderAppointState orderAppointState;
@property(nonatomic, assign) id <ACAppointSelectorProtocol> delegate;
- (void)updateDataSource:(ACAvailableListDTO *)listDto;
@end

