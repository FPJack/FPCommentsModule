//
//  FPCommentCell.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)id<FPCommentProtocal> model;
@end

NS_ASSUME_NONNULL_END
