//
//  ACAvailableListDTO.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/10.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ACAvailableDayDTO;

@interface ACAvailableListDTO : NSObject

@property (nonatomic,strong)NSArray<ACAvailableDayDTO *> *schedules;

@end

@class ACAvailableDTO;

@interface ACAvailableDayDTO : NSObject
//预约日期
@property (nonatomic,copy) NSString *appointdate;
// 预约是今天的且过号
@property (nonatomic,copy) NSString *isPassToday;
//秘钥
@property (nonatomic,copy)NSArray<ACAvailableDTO *> *slots;

@end

@interface ACAvailableDTO : NSObject
//第几个槽
@property (nonatomic,copy)NSString *slot;
//开始时间
@property (nonatomic,copy)NSString *starttime;
//结束时间
@property (nonatomic,copy)NSString *endtime;
//还可以预约几个
@property (nonatomic,copy)NSString *availablecount;
//预约总数
@property (nonatomic,copy)NSString *totalcount;
//预约日期
@property (nonatomic,copy)NSString *appointdate;

// 预约是今天的且过号
@property (nonatomic,copy) NSString *isPassToday;

@end
