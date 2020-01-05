//
//  FPCommentSectionController.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentSectionController : IGListSectionController
@property (nonatomic,weak)id <CommentEventDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
