//
//  ImageLabelCollectionCell.h
//  ZCJLiuBaPet
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 zhichongjia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageLabelCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgLeftCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidthCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeightCon;

@end

NS_ASSUME_NONNULL_END
