//
//  ViewController.m
//  悬浮headerview
//
//  Created by 曾勇 on 16/6/6.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "Masonry.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    HeaderView *headerView;
    NSArray *array;
}
//@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);

    [self.view addSubview:tableView];
    
    //添加监听，动态观察tableview的contentOffset的改变
    [tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
    array = @[@"12",@"233",@"342",@"234"];
    
    headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 200)];
    UIImageView *img =[[UIImageView alloc]init];
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.image =[UIImage imageNamed:@"user-background-320"];
//    img.userInteractionEnabled=YES;
    [headerView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView);
        make.left.equalTo(headerView);
        make.bottom.equalTo(headerView);
        make.right.equalTo(headerView);
    }];

    headerView.backgroundColor =[UIColor redColor];
    [self.view addSubview:headerView];
}
#pragma mark KVC 回调
//本例设置headerView的最大高度为200，最小为64
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"contentOffset"])
    {
        CGPoint offset = [change[NSKeyValueChangeNewKey] CGPointValue];
       
        if (offset.y <= 0 && -offset.y >= 200) {
            
            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, -offset.y);
            headerView.frame = newFrame;
            if (-offset.y <=200)
            {
                tableView.contentInset = UIEdgeInsetsMake(-offset.y, 0, 0, 0);
            }
        } else {
//            CGRect newFrame = CGRectMake(0, 0, self.view.frame.size.width, 64);
//            headerView.frame = newFrame;
//            tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        }
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = array[indexPath.row];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
