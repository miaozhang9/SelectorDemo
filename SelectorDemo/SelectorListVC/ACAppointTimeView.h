//
//  ACAppointTimeView.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ACAvailableListDTO.h"

typedef void(^AppointTimeCallBackBlcok) (BOOL isSuccess, ACAvailableDTO *dto);

@interface ACAppointTimeView : UIView

@property (nonatomic, copy)AppointTimeCallBackBlcok timeViewAppointCallBackBlcok;
- (void)updateDataArray:(NSArray *)timeArray;

@end

@interface ACAppointTimeCell : UITableViewCell

@property (nonatomic, copy)AppointTimeCallBackBlcok timeCellappointCallBackBlcok;

- (void)updateAppointItem:(ACAvailableDTO *)dto;

@end

@interface ACAppointTimeCellDescribeView: UIView

@property (nonatomic, strong) UILabel *numLb;

@end

