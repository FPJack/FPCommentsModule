//
//  FPCommentVC.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit.h>
#import "FPBottomCommentView.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentVC : UIViewController
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray *datas;
@property (nonatomic,strong)FPBottomCommentView *bottomCommentView;
@end
NS_ASSUME_NONNULL_END
