//
//  ViewController.m
//  cell行高计算折叠效果
//
//  Created by 周尊贤 on 16/9/6.
//  Copyright © 2016年 周尊贤. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "CellModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray * titleArr;

@property(nonatomic,strong)NSArray * bottonArr;

@property(nonatomic,weak)NSIndexPath *  index;

@property(nonatomic,strong)NSMutableArray * modelArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.titleArr = @[@"上单",@"打野",@"中单",@"adc",@"套路",@"懒懒",@"蘑菇"];
     self.bottonArr = @[@"报道称，东部大猩猩过去的濒危程度为3个级别中的中间一档。东部大猩猩在野生环境中即将灭绝，濒危程度赶上了西部大猩猩和婆罗洲猩猩等3种大型类人猿",@"据了解，东部大猩猩有两个亚种，分别为山地大猩猩和东部低地大猩猩。遭偷猎者猎杀或捕获的事件屡禁不绝，据IUCN称，东部大猩猩的栖息数量近20年来减少7成以上，已不足5000只。大型类人猿的同伴黑猩猩和倭黑猩猩的濒危程度停留在3个级别中的中间一档",@"大熊猫是中国的国宝，也是全世界珍贵的自然遗产。长期以来，中国政府高度重视大熊猫保护管理，大熊猫保护取得初步成效。根据2015年年初公布的中国第四次大熊猫调查结果，大熊猫野外种群数量从2003年的1596只增加到2013年的1864只，增长了16.8%；圈养种群数量从164只增加到375只",@"主要原因如下：一是栖息地破碎化仍是威胁其生存的主要因素，部分局域种群仍面临生存风险。大熊猫仅分布与川、陕、甘三省的狭窄地区，由于自然隔离和人为干扰等因素的影响，大熊猫野外种群被分割成33个局域种群。个体数量小于30只、具有灭绝风险的种群有22个，个体数量小于10只、具有高度灭绝风险的局域种群有18个",@"二是种群交流状况有待改善。受栖息地破碎化影响，大熊猫局域种群基因交流受阻。加之地域和管理体制的影响，各大熊猫圈养单位圈养个体间的基因交流不足。需进一步加强大熊猫基因交流，以保持整个种群的遗传多样性，维持种群生存活力。",@"四是保护管理能力仍需加强。部分大熊猫分布区存在保护经费投入不足、一线工作人员专业技能普遍偏低等情况，严重制约了大熊猫保护成效，保护管理能力亟待提高。",@"下一步，我们仍需继续坚持不懈地加强大熊猫保护工作。按照国家一级重点保护野生动物和《濒危野生动植物种国际贸易公约》附录一物种的保护要求，加强大熊猫保护。我国计划开展大熊猫及栖息地保护工程建设和大熊猫国家公园建设等工作，继续开展大熊猫栖息地保护与恢复，加强科技与公关和人才培养，促进野生种群复壮，提升大熊猫保护管理水平，推动大熊猫保护工作的深入开展"];
     
     NSLog(@"%zd",self.bottonArr.count);
     NSLog(@"%zd",self.titleArr.count);
     
     for (int i = 0; i<self.titleArr.count; i++) {
          
          CellModel* model = [[CellModel alloc]init];
          model.title = self.titleArr[i];
          model.bootmTitle = self.bottonArr[i];
          [self.modelArr addObject:model];
     }
     
    
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.modelArr.count;

}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (cell == nil) {
        cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
     CellModel * model = self.modelArr[indexPath.row];
     cell.model = model;
     if (model.isDidSelectCell) {
          cell.bottonLable.hidden = false;
     }else {
      cell.bottonLable.hidden = true;
     }
    
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        CellModel * model = self.modelArr[indexPath.row];
     model.isDidSelectCell = !model.isDidSelectCell;
     
     NSIndexPath *index=[NSIndexPath indexPathForRow:indexPath.row inSection:0];
     
     model.idexPath = indexPath;
     [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationMiddle];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
      CellModel * model = self.modelArr[indexPath.row];
     if (model.isDidSelectCell) {
          if (model.idexPath == indexPath) {
               CGSize bootomSize = [model.bootmTitle boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width -24, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
               
               return  40+ 10 + bootomSize.height;
          }
     }
     
     return 44;
    

}

-(NSMutableArray *)modelArr {
     
     if (_modelArr == nil) {
          _modelArr = [NSMutableArray arrayWithCapacity:1];
     }
     return _modelArr;

}

@end
