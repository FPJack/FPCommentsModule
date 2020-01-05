//
//  IGListBaseModel.m
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "IGListBaseModel.h"

@implementation IGListBaseModel
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
    IGListBaseModel *obj = (IGListBaseModel*)object;
    if (![obj isKindOfClass:[IGListBaseModel class]]) return NO;
    if (![self isEqual:object]) return NO;
    return [self.diffId isEqualToString:obj.diffId];
}

@end
