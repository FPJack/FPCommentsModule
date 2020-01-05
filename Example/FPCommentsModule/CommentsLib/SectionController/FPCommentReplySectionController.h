//
//  FPCommentReplySectionController.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentReplySectionController : IGListSectionController
@property (nonatomic,strong)void (^userInfoBlock)(id<FPLinkProtocal> link);
@property (nonatomic,strong)void (^replayBlock)(id<FPCommentReplayProtocal> model);

@end

NS_ASSUME_NONNULL_END
