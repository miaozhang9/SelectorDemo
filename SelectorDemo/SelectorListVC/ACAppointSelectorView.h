//
//  ACAppointSelectorView.h
//  SelectorDemo
//
//  Created by Miaoz on 2018/4/11.
//  Copyright © 2018年 Miaoz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACAvailableListDTO.h"
#import "ACAppointSelectorProtocol.h"

@interface ACAppointSelectorView : UIView
@property (nonatomic, weak) id <ACAppointSelectorProtocol> delegate;
- (void)updateDataSource:(ACAvailableListDTO *)listDto;

@end

@interface ACAppointSelectorTitleView : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@end

@interface ACAppointSelectorNoteView : UIView
@property (nonatomic, strong) UILabel *noteLabel;

@end
