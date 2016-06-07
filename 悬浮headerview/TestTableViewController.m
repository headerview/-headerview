//
//  TestTableViewController.m
//  悬浮headerview
//
//  Created by 曾勇 on 16/6/7.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "TestTableViewController.h"

@interface TestTableViewController()
@property (weak, nonatomic) IBOutlet UIView *headerView;
@property(nonatomic,strong)UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end
@implementation TestTableViewController
-(void)viewDidLoad{
    [super viewDidLoad];
//    UIRefreshControl *re = [[UIRefreshControl alloc]init];
   
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //图片高度
    CGFloat imageHeight = self.headerView.frame.size.height;
    //图片宽度
    CGFloat imageWidth = self.view.bounds.size.width;
    //图片上下偏移量
    CGFloat imageOffsetY = scrollView.contentOffset.y;
    
    NSLog(@"图片上下偏移量 imageOffsetY:%f ->",imageOffsetY);
    
    
    
    //下移
    if (imageOffsetY < 0) {
        CGFloat totalOffset = imageHeight + ABS(imageOffsetY);
        CGFloat f = totalOffset / imageHeight;
        
        self.imgView.frame = CGRectMake(-(imageWidth * f - imageWidth) * 0.5, imageOffsetY, imageWidth * f, totalOffset);
    }
}
@end
