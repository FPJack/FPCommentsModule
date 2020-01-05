//
//  CollectionLabelCell.h
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionLabelCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCon;

@end

NS_ASSUME_NONNULL_END
