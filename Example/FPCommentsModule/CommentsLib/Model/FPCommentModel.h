//
//  FPCommentModel.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FPCommentProtocal.h"
#import "IGListBaseModel.h"
#import <IGListKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentUserInfoModel : IGListBaseModel<FPCommentUserInfoProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentExpandInfoModel : IGListBaseModel<FPCommentExpandProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentContentModel : IGListBaseModel<FPCommentContentProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentPictureModel : IGListBaseModel<FPCommentPictureProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentReplayModel : IGListBaseModel<FPCommentReplayProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentReplayContainerModel : IGListBaseModel<FPCommentReplayContainerProtocal>
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentModel : IGListBaseModel<FPCommentProtocal>
@end
NS_ASSUME_NONNULL_END
