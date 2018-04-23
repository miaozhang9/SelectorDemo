# SelectorDemo
### 1.左右联动选择器（两个TableView实现）
### 2.上下联动选择表（一个CollectionView和一个TableView实现）
（注意：pod库需要导入 pod 'Masonry', '1.1.0'）



### *代码调用事例
#### *左右联动选择器
```
ACChoiceAppointTimeViewController *appointTimeVC =[[ACChoiceAppointTimeViewController alloc]initWithAppointTimeDelegate:self];
[appointTimeVC updateDataSource:[self getData]];
[appointTimeVC presentAppointTimeViewWithController:self.navigationController];
```
#### *上下联动选择表(Push)
```
ACAppointSelectorViewController *appointSelectorVC = [[ACAppointSelectorViewController alloc] init];
appointSelectorVC.delegate = self;
[appointSelectorVC updateDataSource:[self getData]];
appointSelectorVC.orderAppointState = ACFaceCheckOrderAppointState_appointupdate;
[self.navigationController pushViewController:appointSelectorVC animated:YES];
```
#### *上下联动选择表(Present)
```
ACAppointSelectorViewController *appointSelectorVC = [[ACAppointSelectorViewController alloc] init];
appointSelectorVC.delegate = self;
[appointSelectorVC updateDataSource:[self getData]];
appointSelectorVC.orderAppointState = ACFaceCheckOrderAppointState_appointupdate;
UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:appointSelectorVC];
[self presentViewController:nav animated:YES completion:nil];
```
#### *数据源
```
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

```
### *左右联动选择器图示
<p align="left">
<img width="375" height="650" src="https://github.com/miaozhang9/SelectorDemo/blob/master/Screenshots/1.png">
</p>


### *上下联动选择表图示
<p align="left">
<img width="375" height="650" src="https://github.com/miaozhang9/SelectorDemo/blob/master/Screenshots/2.png">
</p>


