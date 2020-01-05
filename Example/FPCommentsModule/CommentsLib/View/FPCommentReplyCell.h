//
//  FPCommentReplyCell.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentReplyCell : UICollectionViewCell
@property (strong, nonatomic)TTTAttributedLabel *commentLab;
@property (nonatomic,strong)id <FPCommentReplayProtocal> model;
@property (nonatomic,strong)void (^userInfoBlock)(id<FPLinkProtocal> link);
@end

NS_ASSUME_NONNULL_END
