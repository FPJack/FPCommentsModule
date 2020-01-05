//
//  FPCommentUserInfoCell.h
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPCommentUserInfoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;
@property (nonatomic,copy)void (^commentBlock)(void);
@end

NS_ASSUME_NONNULL_END
