//
//  FPCommentHelper.h
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol CommentEventDelegate;
NS_ASSUME_NONNULL_BEGIN
@interface FPCommentHelper : NSObject
@property (nonatomic,strong)NSString *name;
+ (instancetype)share;
+ (CGFloat)configurTextHeight:(NSString*)text font:(UIFont*)font widht:(CGFloat)width;
+ (CGFloat)configurTextHeightText:(NSString*)text font:(UIFont*)font widht:(CGFloat)width numberOfLines:(int)numberOfLines;
+ (CGFloat)configurTTTAttributedLabelTextHeightText:(NSString*)text configure:(NSDictionary*)config width:(CGFloat)width numberOfLines:(int)numberOfLines;

@end
NS_ASSUME_NONNULL_END
