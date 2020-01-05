//
//  ImageLabelWHCell.h
//  ZCJLiuBaPet
//
//  Created by fanpeng on 2019/11/29.
//  Copyright © 2019 zhichongjia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageLabelWHCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidthCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeightCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgLeftCon;

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

NS_ASSUME_NONNULL_END
