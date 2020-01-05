//
//  FPCommentToolView.h
//  test
//
//  Created by fanpeng on 2019/11/20.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SeparatorView.h"
typedef NS_ENUM(NSUInteger, ActionType) {
    ActionTypeSayBtn = 100,
    ActionTypeSBtn1,
    ActionTypeSBtn2,
    ActionTypeSBtn3
};
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentToolView : UIView
@property (weak, nonatomic) IBOutlet UIView *bagView;
@property (weak, nonatomic) IBOutlet UIButton *sBtn1;
@property (weak, nonatomic) IBOutlet UIButton *sBtn2;
@property (weak, nonatomic) IBOutlet UIButton *sBtn3;
@property (weak, nonatomic) IBOutlet UIButton *sayBtn;
@property (weak, nonatomic) IBOutlet SeparatorView *separtorView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCon;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightCon;

@property (nonatomic,copy)void (^tapAction)(UIButton* btn,ActionType type);
@end
NS_ASSUME_NONNULL_END
