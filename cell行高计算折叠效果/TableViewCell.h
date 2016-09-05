//
//  TableViewCell.h
//  cell行高计算折叠效果
//
//  Created by 周尊贤 on 16/9/6.
//  Copyright © 2016年 周尊贤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellModel;
@interface TableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel * titleLable;

@property(nonatomic,strong)UILabel * bottonLable;

@property(nonatomic,strong)CellModel * model;
@end
