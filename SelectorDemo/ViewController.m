//
//  ViewController.m
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/10.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import "ViewController.h"
#import "ACChoiceAppointTimeViewController.h"
#import "ACAvailableListDTO.h"
#import "NSDate+Addtion.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<PCChoiceAppointTimeDelegate>
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"左右联动选择器" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"上下联动选择列表" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(click2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UILabel *titleLab = [UILabel new];
    titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab = titleLab;
    [self.view addSubview:titleLab];
    
    __weak typeof (self) weakself = self;
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(60 + 100));
        make.left.equalTo(@60);
        make.right.equalTo(@-60);
        make.height.equalTo(@60);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.top.equalTo(button.mas_bottom).offset(50);
        make.size.equalTo(button);
    }];

    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(button);
        make.top.equalTo(@(60 + 10));
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 60));
    }];
   
}

#pragma mark -data
- (ACAvailableListDTO *)getData {
    ACAvailableListDTO *dto = [ACAvailableListDTO new];
    
    ACAvailableDayDTO *dayDTO = [ACAvailableDayDTO new];
    dayDTO.appointdate = @"1523289600000";
    dayDTO.isPassToday = @"0";
    
    ACAvailableDayDTO *dayDTO2 = [ACAvailableDayDTO new];
    dayDTO2.appointdate = @"1523376000000";
    dayDTO2.isPassToday = @"0";
    
    ACAvailableDayDTO *dayDTO3 = [ACAvailableDayDTO new];
    dayDTO3.appointdate = @"1523462400000";
    dayDTO3.isPassToday = @"0";
    
    NSMutableArray *schedules = [NSMutableArray new];
    [schedules addObject: dayDTO];
    [schedules addObject: dayDTO2];
    [schedules addObject: dayDTO3];
    dto.schedules = schedules;
   
    ACAvailableDTO *timeDTO = [ACAvailableDTO new];
    timeDTO.appointdate = @"1523289600000";
    timeDTO.availablecount = @"87";
    timeDTO.starttime = @"19:30";
    timeDTO.endtime = @"20:00";
    timeDTO.slot = @"40";
    timeDTO.totalcount = @"88";
    
    NSMutableArray *slots = [NSMutableArray new];
    [slots addObject: timeDTO];
    [slots addObject: timeDTO];
    [slots addObject: timeDTO];
    [slots addObject: timeDTO];
    [slots addObject: timeDTO];
    
    dayDTO.slots = slots;
    dayDTO2.slots = slots;
    dayDTO3.slots = slots;
    
    return dto;
}

#pragma mark -action

- (void)click:(id)sender {
    ACChoiceAppointTimeViewController *appointTimeVC =[[ACChoiceAppointTimeViewController alloc]initWithAppointTimeDelegate:self];
    [appointTimeVC updateDataSource:[self getData]];
    [appointTimeVC presentAppointTimeViewWithController:self.navigationController];
    
    
    
}

- (void)click2:(id)sender {
    
}


#pragma mark -PCChoiceAppointTimeDelegate

- (void)confirmChoiceAppointTime:(NSString *)appointDate availableDTO:(ACAvailableDTO*)availableDTO {
    //回调
    
    _titleLab.text = [NSString stringWithFormat:@"%@  %@",[NSDate onlydateFormatterWithTime:appointDate],[NSString stringWithFormat:@"%@ - %@", availableDTO.starttime, availableDTO.endtime]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
