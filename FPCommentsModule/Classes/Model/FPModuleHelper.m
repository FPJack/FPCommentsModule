//
//  FPModuleHelper.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import "FPModuleHelper.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
@implementation FPModuleHelper
+ (CGFloat)configureTextHeight:(NSString*)text font:(UIFont*)font widht:(CGFloat)width{
    if (text == nil || text.length == 0) return 0;
    return [self configureTextHeightText:text font:font widht:width numberOfLines:0];
}
+ (CGFloat)configureTextHeightText:(NSString*)text font:(UIFont*)font widht:(CGFloat)width numberOfLines:(int)numberOfLines{
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
+ (CGFloat)configureTTTAttributedLabelTextHeightText:(NSString*)text configure:(NSDictionary*)config width:(CGFloat)width numberOfLines:(int)numberOfLines{
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
