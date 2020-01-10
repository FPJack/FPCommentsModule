//
//  FPIgListBaseModel.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPIgListBaseModel.h"
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



@implementation FPNestedModel
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





