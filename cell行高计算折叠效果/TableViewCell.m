//
//  TableViewCell.m
//  cell行高计算折叠效果
//
//  Created by 周尊贤 on 16/9/6.
//  Copyright © 2016年 周尊贤. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"
#import "CellModel.h"
@interface TableViewCell()



@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(CellModel *)model {
    
    _model = model;
    
    self.titleLable.text = model.title;
    
    self.bottonLable.text = model.bootmTitle;

}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLable];
        
        [self.contentView addSubview:self.bottonLable];
        
      [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.contentView).offset(12);
          make.right.equalTo(self.contentView).offset(-12);
          make.top.equalTo(self.contentView).offset(5);
          make.height.equalTo(@35);
      }];
        [self.bottonLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLable.mas_left);
            make.right.equalTo(self.titleLable.mas_right);
            make.top.equalTo(self.titleLable.mas_bottom);
            
        }];

    }
    
    return self;

}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
   

}

-(UILabel *)titleLable{
    
    if (_titleLable == nil) {
        _titleLable = [[UILabel alloc]init];
        _titleLable.numberOfLines = 1;
        _titleLable.textColor = [UIColor  darkGrayColor];
        _titleLable.font = [UIFont systemFontOfSize:16];
    }
    
    return _titleLable;

}

-(UILabel *)bottonLable{
    
    if (_bottonLable == nil) {
        _bottonLable = [[UILabel alloc]init];
        _bottonLable.numberOfLines = 0;
        _bottonLable.textColor = [UIColor  brownColor];
        _bottonLable.font = [UIFont systemFontOfSize:14];
        _bottonLable.hidden = true;
    }
    
    return _bottonLable;
    
}

@end
