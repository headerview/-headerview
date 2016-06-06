//
//  MyView.m
//  悬浮headerview
//
//  Created by 曾勇 on 16/6/6.
//  Copyright © 2016年 ZY. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
-(instancetype)init{
    if (self=[super init]) {
            }
    return self;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *result = [super hitTest:point withEvent:event];
    if (result == self) {
        return nil;
    } else {
        return result;
    }
}
@end
