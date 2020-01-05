//
//  FPCommentUserInfSectionController.h
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <IGListKit/IGListKit.h>
@protocol FPCommentUserInfoProtocal;
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentUserInfSectionController : IGListSectionController
@property (nonatomic,copy)void (^commentBlock)(id<FPCommentUserInfoProtocal> model);

@end

NS_ASSUME_NONNULL_END
