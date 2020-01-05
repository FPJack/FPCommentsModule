//
//  FPBottomCommentView.h
//  test
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPBottomCommentView : UIView
@property (nonatomic,copy)void (^tapCommentBlock)(void);
@end

NS_ASSUME_NONNULL_END
