//
//  FPNumberItemModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/9.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPNumberItemModel.h"

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
