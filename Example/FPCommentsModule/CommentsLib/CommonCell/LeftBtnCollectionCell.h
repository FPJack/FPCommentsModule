//
//  LeftBtnCollectionCell.h
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeftBtnCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (nonatomic,copy)void (^tapBlock)(UIButton * btn);
@end

NS_ASSUME_NONNULL_END
