//
//  FPCommonCollectionCell.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface FPCommonCollectionCell : UICollectionViewCell

@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPBtnCollectionCell : UICollectionViewCell
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,copy)void (^tapBlock)(UIButton *button);
@property (nonatomic,strong)NSLayoutConstraint *leftCon;
@property (nonatomic,strong)NSLayoutConstraint *rightCon;
@property (nonatomic,strong)NSLayoutConstraint *bottomCon;
@property (nonatomic,strong)NSLayoutConstraint *topCon;
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPTextCollectionCell : UICollectionViewCell
@property (nonatomic,strong)UILabel *label;
@property (nonatomic,strong)NSLayoutConstraint *leftCon;
@property (nonatomic,strong)NSLayoutConstraint *rightCon;
@property (nonatomic,strong)NSLayoutConstraint *bottomCon;
@property (nonatomic,strong)NSLayoutConstraint *topCon;
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPUserInfoCollectionCell : UICollectionViewCell
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UIButton *rightButton;
@end
NS_ASSUME_NONNULL_END

