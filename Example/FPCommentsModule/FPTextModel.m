//
//  FPTextModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPTextModel.h"
#define kSWidth [UIScreen mainScreen].bounds.size.width
#import "FPCommentHelper.h"
@implementation FPTextModel
@synthesize height = _height;

- (CGFloat)height{
    if (self.content != nil && self.content.length > 0) {
        CGFloat width = kSWidth - 68 - 16;
        if (self.numberOfLines == 0) {
            _height = [FPCommentHelper configurTextHeight:self.content font:kContentFont widht:width];
        }else{
          CGFloat  cHeight = [FPCommentHelper configurTextHeight:self.content font:kContentFont widht:width];
           CGFloat  sHeight = [FPCommentHelper configurTextHeightText:self.content font:kContentFont widht:width numberOfLines:self.numberOfLines];
            _height = sHeight > cHeight ? cHeight : sHeight;
        }
        _height += 5 * 2;
    }
    return _height;
}
@end
