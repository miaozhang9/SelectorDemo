//
//  ViewController.m
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/10.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import "ViewController.h"
#import "ACChoiceAppointTimeViewController.h"
#import "ACAppointSelectorViewController.h"
#import "ACAvailableListDTO.h"
#import "NSDate+Addtion.h"
#import "UIColor+Addtion.h"
#import <Masonry/Masonry.h>

@interface ViewController ()<PCChoiceAppointTimeDelegate,ACAppointSelectorProtocol>
@property (nonatomic, strong) UILabel *titleLab;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor pc_colorWithHexString:@"#FFFFFF"]];
    self.navigationController.navigationBar.barTintColor = [UIColor pc_colorWithHexString:@"#FFFFFF"];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"左右联动选择器" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"上下联动选择列表(push)" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(click2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setTitle:@"上下联动选择列表(present)" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor redColor];
    [button3 addTarget:self action:@selector(click3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UILabel *titleLab = [UILabel new];
    titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab = titleLab;
    [self.view addSubview:titleLab];
    
    __weak typeof (self) weakself = self;
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.top.equalTo(@(10+ 64));
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 60));
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(50);
        make.left.equalTo(@60);
        make.right.equalTo(@-60);
        make.height.equalTo(@60);
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.top.equalTo(button.mas_bottom).offset(50);
        make.size.equalTo(button);
    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.top.equalTo(button2.mas_bottom).offset(50);
        make.size.equalTo(button);
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
    
    ACAvailableDayDTO *dayDTO4 = [ACAvailableDayDTO new];
    dayDTO4.appointdate = @"1523550000000";
    dayDTO4.isPassToday = @"0";
    ACAvailableDayDTO *dayDTO5 = [ACAvailableDayDTO new];
    dayDTO5.appointdate = @"1523980800000";
    dayDTO5.isPassToday = @"0";
    
    
    
    NSMutableArray *schedules = [NSMutableArray new];
    [schedules addObject: dayDTO];
    [schedules addObject: dayDTO2];
    [schedules addObject: dayDTO3];
    [schedules addObject: dayDTO4];
    [schedules addObject: dayDTO5];
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
    dayDTO4.slots = slots;
    dayDTO5.slots = slots;

    return dto;
}

#pragma mark -action

- (void)click:(id)sender {
    ACChoiceAppointTimeViewController *appointTimeVC =[[ACChoiceAppointTimeViewController alloc]initWithAppointTimeDelegate:self];
    [appointTimeVC updateDataSource:[self getData]];
    [appointTimeVC presentAppointTimeViewWithController:self.navigationController];
}

- (void)click2:(id)sender {
    
    ACAppointSelectorViewController *appointSelectorVC = [[ACAppointSelectorViewController alloc] init];
    appointSelectorVC.delegate = self;
    [appointSelectorVC updateDataSource:[self getData]];
    appointSelectorVC.orderAppointState = ACFaceCheckOrderAppointState_appointupdate;
    [self.navigationController pushViewController:appointSelectorVC animated:YES];
  
}

- (void)click3:(id)sender {
    ACAppointSelectorViewController *appointSelectorVC = [[ACAppointSelectorViewController alloc] init];
    appointSelectorVC.delegate = self;
    [appointSelectorVC updateDataSource:[self getData]];
    appointSelectorVC.orderAppointState = ACFaceCheckOrderAppointState_appointupdate;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:appointSelectorVC];
    [self presentViewController:nav animated:YES completion:nil];
}




#pragma mark -PCChoiceAppointTimeDelegate

- (void)confirmChoiceAppointTime:(NSString *)appointDate availableDTO:(ACAvailableDTO*)availableDTO {
    //回调
    
    _titleLab.text = [NSString stringWithFormat:@"上下联动%@  %@",[NSDate onlydateFormatterWithTime:appointDate],[NSString stringWithFormat:@"%@ - %@", availableDTO.starttime, availableDTO.endtime]];
    
}

#pragma mark -ACAppointSelectorProtocol
- (void)confirmAppointSelectTime:(ACAvailableDayDTO *)availableDayDTO availableDTO:(ACAvailableDTO *)availableDTO {
    
    _titleLab.text = [NSString stringWithFormat:@"上下联动%@  %@",[NSDate onlydateFormatterWithTime:availableDayDTO.appointdate],[NSString stringWithFormat:@"%@ - %@", availableDTO.starttime, availableDTO.endtime]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
