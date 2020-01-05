//
//  SeparatorView.m
//  ZCJLiuBaPet
//
//  Created by fanpeng on 2019/11/30.
//  Copyright © 2019 zhichongjia. All rights reserved.
//

#import "SeparatorView.h"

@implementation SeparatorView
- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor grayColor];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
            self.backgroundColor = [UIColor grayColor];
    }
    return self;
}
@end
