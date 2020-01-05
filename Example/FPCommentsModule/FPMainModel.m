//
//  FPMainModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPMainModel.h"

@implementation FPMainModel
@synthesize height = _height;
- (CGFloat)height{
    if (_height == 0) {
        __block CGFloat height = 0;
        [self.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            height += (obj.height + obj.inset.top + obj.inset.bottom);
        }];
        height += (self.inset.top + self.inset.bottom);
        _height = height;
    }
    return _height;
}
@end
