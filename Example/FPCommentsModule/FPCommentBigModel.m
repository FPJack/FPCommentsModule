//
//  FPCommentBigModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPCommentBigModel.h"
#import "FPCommentSubModel.h"
#import <FPCommentSubSectionController.h>
#import "FPUserModel.h"
#import "FPCommentUserInfSectionController.h"
#define kSWidth [UIScreen mainScreen].bounds.size.width

@implementation FPCommentBigModel
@synthesize height = _height;
- (CGFloat)height{
    if (_height == 0 && self.subSectionModels.count > 0) {
        __block CGFloat height = 0;
        [self.subSectionModels enumerateObjectsUsingBlock:^(id<FPCommentSubProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            height += (obj.height + obj.inset.bottom + obj.inset.top);
        }];
        height += (self.inset.bottom + self.inset.top);
        _height = height;
    }
    return _height;
}
- (NSMutableArray<id<FPSectionModelProtocal,FPSectionControllerProtocal>> *)subSectionModels{
    if (!_subSectionModels) {
        NSMutableArray *arr = [NSMutableArray array];
        CGFloat width = kSWidth - 68 - 12 * 2 - 20;
        for (int i = 0; i < 50; i ++) {
            FPCommentSubModel *model = [FPCommentSubModel new];
            model.sectionController = [FPCommentSubSectionController new];
            model.commentText = @"随着项目的不断迭代，各个模块会越来越复杂，各个模块相互依赖，而且每个模块可能会有共同的业务逻辑，导致整个项目维护起来比较麻烦。";
            model.commentByUserName = @"评论人";
            model.commentUserName = @"回复人";
            model.commentByUserId = @"444";
            model.commentUserId = @"333";
            model.commentId = @"9333993";
            model.width = width;
            if (i == 0) {
                model.inset = UIEdgeInsetsMake(10, 12, 0, 12);
            }else if (i == 49){
                model.inset = UIEdgeInsetsMake(0, 12, 10, 12);
            }
            [arr addObject:model];
        }
        _subSectionModels = arr;
    }
    return _subSectionModels;
}
- (UIEdgeInsets)inset{
    return UIEdgeInsetsMake(0, 68, 0, 20);
}
@end
