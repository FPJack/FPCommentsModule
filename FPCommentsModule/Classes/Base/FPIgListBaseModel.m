//
//  FPIgListBaseModel.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPIgListBaseModel.h"

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
