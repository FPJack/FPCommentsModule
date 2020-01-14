//
//  FPIgListBaseModel.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPNestedModel.h"
#import "FPModuleHelper.h"
@implementation FPTextModel
@synthesize height = _height;
- (CGFloat)height{
    if (self.content != nil && self.content.length > 0) {
        CGFloat width = self.width;
        if (self.numberOfLines == 0) {
            _height = [FPModuleHelper configureTextHeight:self.content font:self.font widht:width];
        }else{
            CGFloat  cHeight = [FPModuleHelper configureTextHeight:self.content font:self.font widht:width];
            CGFloat  sHeight = [FPModuleHelper configureTextHeightText:self.content font:self.font widht:width numberOfLines:self.numberOfLines];
            _height = sHeight > cHeight ? cHeight : sHeight;
        }
    }
    return _height;
}
@end


@implementation FPModuleBaseModel

@end
@implementation FPDequeueReusableModel

@synthesize size;

@end


@implementation FPNestedModel
@synthesize height = _height;
- (CGFloat)height{
    if (_height == 0) {
        __block CGFloat height = 0;
        [self.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            height += (obj.height + obj.sectionInset.top + obj.sectionInset.bottom);
            //头尾部视图高度
            if ([obj.header respondsToSelector:@selector(height)]) {
                height += obj.header.height;
            }
            if ([obj.footer respondsToSelector:@selector(height)]) {
                height += obj.footer.height;
            }
        }];
        //contentInset
        height += (self.sectionInset.top + self.sectionInset.bottom);
        height += (self.collectionViewContentInset.top + self.collectionViewContentInset.bottom);
        _height = height;
    }
    return _height;
}
- (void)setConfiureSubSectionModelBlock:(void (^)(id<FPSectionModelProtocal,FPSectionControllerProtocal> _Nonnull))confiureSubSectionModelBlock{
    if (!confiureSubSectionModelBlock) return;
    _confiureSubSectionModelBlock = confiureSubSectionModelBlock;
    __weak typeof(self) weakSelf = self;
    [weakSelf.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        confiureSubSectionModelBlock(obj);
    }];
}
@end


@implementation FPIgListBaseModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.diffId = [NSString stringWithFormat:@"%f",NSDate.date.timeIntervalSince1970];
    }
    return self;
}
- (nonnull id<NSObject>)diffIdentifier {return self.diffId;}
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    FPIgListBaseModel *obj = (FPIgListBaseModel*)object;
    if (![obj isKindOfClass:[FPIgListBaseModel class]]) return NO;
    if (![self isEqual:object]) return NO;
    return [self.diffId isEqualToString:obj.diffId];
}
@end
@implementation FPUserModel
@end


@implementation FPNumberItemModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.diffId = [NSString stringWithFormat:@"%f",NSDate.date.timeIntervalSince1970];
    }
    return self;
}
- (nonnull id<NSObject>)diffIdentifier {return self.diffId;}
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    FPNumberItemModel *obj = (FPNumberItemModel*)object;
    if (![obj isKindOfClass:[FPNumberItemModel class]]) return NO;
    if (![self isEqual:object]) return NO;
    return [self.diffId isEqualToString:obj.diffId];
}
@end

