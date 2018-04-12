//
//  ACAppointSelectorViewController.m
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import "ACAppointSelectorViewController.h"
#import "ACAppointSelectorView.h"
#import <Masonry/Masonry.h>
#import "ACAlertManager.h"
#import "NSDate+Addtion.h"
#import "UIFont+Addtion.h"
#import "UIColor+Addtion.h"


@interface ACAppointSelectorViewController ()<ACAppointSelectorProtocol>
@property (nonatomic, strong) ACAppointSelectorView *appointSelectorView;
@end

@implementation ACAppointSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController.navigationBar setBackgroundColor:[UIColor pc_colorWithHexString:@"#FFFFFF"]];
    self.navigationController.navigationBar.barTintColor = [UIColor pc_colorWithHexString:@"#FFFFFF"];
    // Do any additional setup after loading the view.
    if (self.orderAppointState == ACFaceCheckOrderAppointState_appointupdate) {
        [self addRightBarButton];
    }
    [self addLeftBarButtonItem];
    [self initAndModifySubviews];
}

- (void)updateDataSource:(ACAvailableListDTO *)listDto {
     [self.appointSelectorView updateDataSource:listDto];
}


#pragma mark - private Methods
- (void)addLeftBarButtonItem {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStylePlain) target:self action:@selector(leftBarBtnAction)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor pc_colorWithHexString:@"#2264F4"]];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont pingFangSCRegularWithSize:16],NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont pingFangSCRegularWithSize:16],NSFontAttributeName, nil] forState:UIControlStateHighlighted];
}


- (void)addRightBarButton {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"放弃预约" style:UIBarButtonItemStylePlain target:self action:@selector(giveUpAppoint)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor pc_colorWithHexString:@"#2264F4"]];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont pingFangSCRegularWithSize:16],NSFontAttributeName, nil] forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont pingFangSCRegularWithSize:16],NSFontAttributeName, nil] forState:UIControlStateHighlighted];
}


- (void) initAndModifySubviews {
    [self.view addSubview:self.appointSelectorView];
    [_appointSelectorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)ac_hideCurrentViewController {
        NSArray *viewcontrollers = self.navigationController.viewControllers;
        if (viewcontrollers.count>1) {
            if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
                //push方式
                [self.navigationController popViewControllerAnimated:YES];
            }
        }
        else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
}
#pragma mark - getter&setter

- (ACAppointSelectorView *)appointSelectorView {
    if (!_appointSelectorView) {
        self.appointSelectorView = [[ACAppointSelectorView alloc] init];
        _appointSelectorView.delegate = self;
    }
    
    return _appointSelectorView;
}


- (void)setOrderAppointState:(ACFaceCheckOrderAppointState)orderAppointState {
    _orderAppointState = orderAppointState;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goBackViewController {
    if (self.presentationController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark -- action
- (void)leftBarBtnAction {
    [self ac_hideCurrentViewController];
}
- (void)giveUpAppoint {
    
    [[ACAlertManager shareAlertManager] setViewController:self];
    __weak typeof(self) weakSelf = self;
    [[ACAlertManager shareAlertManager] showAlertMessageWithTitle:@"重要！" content:@"您将放弃已成功预约的面核时间，\n选择放弃，您需要重新预约" okeyTitle:@"放弃" okeyAction:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        
      [strongSelf ac_hideCurrentViewController];
    } cancelTitle:@"取消" cancelAction:^{
        
    }];
    
}

#pragma mark --ACAppointSelectorDelegate

- (void)confirmAppointSelectTime:(ACAvailableDayDTO *)availableDayDTO availableDTO:(ACAvailableDTO *)availableDTO {
    
    [[ACAlertManager shareAlertManager] setViewController:self];
    __weak typeof(self) weakSelf = self;
    [[ACAlertManager shareAlertManager] showAlertMessageWithTitle:@"温馨提示" content:@"确定预约该时段进行面核？" okeyTitle:@"预约" okeyAction:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.orderAppointState == ACFaceCheckOrderAppointState_appointInterview) {
           
        } else if (strongSelf.orderAppointState == ACFaceCheckOrderAppointState_appointupdate) {
            
        }
        
        if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(confirmAppointSelectTime:availableDTO:)]) {
            [strongSelf.delegate confirmAppointSelectTime:availableDayDTO availableDTO:availableDTO];
        }
        
        [strongSelf ac_hideCurrentViewController];
        
    } cancelTitle:@"取消" cancelAction:^{
        
    }];
    
}

#pragma mark -- 接口
//获取预约选择时间
//预约面签
//取消预约
//预约改期


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
