//
//  ACChoiceAppointTimeListView.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/10.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACAvailableListDTO.h"

typedef enum : NSUInteger {
    ACChoiceAppointTimeView_Day,
    ACChoiceAppointTimeView_time
} ACChoiceAppointTimeViewType;

#define kRowHeight 44

@protocol ACChoiceAppointTimeListViewDelegate <NSObject>

- (void)choiceAppointTimeListView:(UITableView *)tableView appointDate:(ACAvailableDayDTO *)appointDay indexPath:(NSIndexPath *)indexPath;

- (void)choiceAppointTimeListView:(UITableView *)tableView availableDTO:(ACAvailableDTO *)availableDTO indexPath:(NSIndexPath *)indexPath;

@end


@interface ACChoiceAppointTimeListView : UIView

@property (nonatomic, weak) id<ACChoiceAppointTimeListViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame viewType:(ACChoiceAppointTimeViewType)viewType;

- (void)updateDataArray:(NSArray *)arr selectIndexPath:(NSIndexPath *)indexPath ;

@end

@interface ACChoiceAppointTimeHeadView : UIView

@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIButton *sureBtn;



@end

@interface ACChoiceAppointTimeDayCell : UITableViewCell

@property (nonatomic, strong) UIView *goldView;
@property (nonatomic, strong) UILabel *titleLb;

- (void)selectState;
- (void)defaultState;

@end

@interface ACChoiceAppointTimeSlotCell : UITableViewCell

@property (nonatomic, strong) UILabel *timeLb;
@property (nonatomic, strong) UILabel *numLb;
@property (nonatomic, strong) UILabel *appointLb;
@property (nonatomic, strong) UIView *lineView;

- (void)updateAppointItem:(ACAvailableDTO *)dto;
- (void)capableAppointState;
- (void)unCapableAppointState;
- (void)selectState;
- (void)defaultState;

@end
