//
//  FPCommentBigModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPCommentBigModel.h"
@implementation FPCommentBigModel
@synthesize height = _height;
- (CGFloat)height{
    if (_height == 0 && self.subSectionModels.count > 0) {
        __block CGFloat height = 0;
        [self.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            height += (obj.height + obj.inset.bottom + obj.inset.top);
        }];
        height += (self.inset.bottom + self.inset.top);
        _height = height;
    }
    return _height;
}
- (UIEdgeInsets)inset{
    return UIEdgeInsetsMake(0, 68, 0, 20);
}
@end
