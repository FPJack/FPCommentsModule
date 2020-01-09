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
      CGFloat width = self.width;
        if (self.numberOfLines == 0) {
            _height = [FPCommentHelper configurTextHeight:self.content font:self.font widht:width];
        }else{
          CGFloat  cHeight = [FPCommentHelper configurTextHeight:self.content font:self.font widht:width];
           CGFloat  sHeight = [FPCommentHelper configurTextHeightText:self.content font:self.font widht:width numberOfLines:self.numberOfLines];
            _height = sHeight > cHeight ? cHeight : sHeight;
        }
    }
    return _height;
}
@end
