//
//  ImageTextCollectionCell.h
//  ZCJLiuBaPet
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 zhichongjia. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageTextCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spaceCon;
@property (weak, nonatomic) IBOutlet UIImageView *dotImgView;

@end

NS_ASSUME_NONNULL_END
