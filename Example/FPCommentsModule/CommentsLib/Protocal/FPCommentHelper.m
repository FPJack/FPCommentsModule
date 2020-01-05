//
//  FPCommentHelper.m
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentHelper.h"
#import <UIKit/UIKit.h>
#import "FPCommentProtocal.h"
@interface FPCommentHelper()
@end
@implementation FPCommentHelper
+ (instancetype)share{
    static FPCommentHelper *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [FPCommentHelper new];
        
    });
    return instance;
}
+ (CGFloat)configurTextHeight:(NSString*)text font:(UIFont*)font widht:(CGFloat)width{
    if (text == nil || text.length == 0) return 0;
    return [self configurTextHeightText:text font:font widht:width numberOfLines:0];
}
+ (CGFloat)configurTextHeightText:(NSString*)text font:(UIFont*)font widht:(CGFloat)width numberOfLines:(int)numberOfLines{
    if (font == nil || width == 0) return 0;
    static UILabel *label;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        label = [UILabel new];
    });
    label.font = font;
    label.text = text;
    label.numberOfLines = numberOfLines;
    return ceil([label sizeThatFits:CGSizeMake(width, MAXFLOAT)].height);
}
+ (CGFloat)configurTTTAttributedLabelTextHeightText:(NSString*)text configure:(NSDictionary*)config width:(CGFloat)width numberOfLines:(int)numberOfLines{
    static TTTAttributedLabel *label;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        label = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        label.numberOfLines = 0;
    });
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        [mutableAttributedString setAttributes:config range:NSMakeRange(0, mutableAttributedString.length)];
        return mutableAttributedString;
    }];
    label.numberOfLines = numberOfLines;
    return ceil([label sizeThatFits:CGSizeMake(width, MAXFLOAT)].height);
}
@end
