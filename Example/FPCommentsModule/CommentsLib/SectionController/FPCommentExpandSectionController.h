//
//  FPCommentExpandSectionController.h
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentExpandSectionController : IGListSectionController
@property (nonatomic,strong)void (^selectBlock)(id<FPCommentExpandProtocal> model, FPCommentExpandSectionController *SC);
@end
NS_ASSUME_NONNULL_END
