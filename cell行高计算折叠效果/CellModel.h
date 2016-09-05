//
//  CellModel.h
//  cell行高计算折叠效果
//
//  Created by 周尊贤 on 16/9/6.
//  Copyright © 2016年 周尊贤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property(nonatomic,copy)NSString * title;

@property(nonatomic,assign )BOOL  isDidSelectCell;

@property(nonatomic,copy)NSString * bootmTitle;

@property(nonatomic,strong)NSIndexPath * idexPath;

@end
