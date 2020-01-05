//
//  FPCommentAccessoryView.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"
NS_ASSUME_NONNULL_BEGIN
//！！！！！！ 内存泄漏的控制器再进去的时候会导致输入框弹不出来 什么鬼
@interface FPCommentAccessoryView : UIView<HPGrowingTextViewDelegate>
@property (nonatomic,copy,nullable)void (^sendBlock)(NSString *text);
+ (instancetype)share;
- (void)show;
- (void)showText:(nullable NSString *)text placholder:(nullable NSString*)placholder block:(void(^)(NSString *text))callBlock;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END
