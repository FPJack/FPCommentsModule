//
//  FPCommentContentSectionController.h
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <IGListKit/IGListKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentContentSectionController : IGListSectionController
@property (nonatomic,strong)id<FPCommentContentProtocal> model;
@property (nonatomic,assign)int numberOfLines;
@end
NS_ASSUME_NONNULL_END
