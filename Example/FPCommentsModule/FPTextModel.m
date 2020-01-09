//
//  FPTextModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPTextModel.h"
#import <FPModuleHelper.h>
@implementation FPTextModel
@synthesize height = _height;

- (CGFloat)height{
    if (self.content != nil && self.content.length > 0) {
      CGFloat width = self.width;
        if (self.numberOfLines == 0) {
            _height = [FPModuleHelper configureTextHeight:self.content font:self.font widht:width];
        }else{
          CGFloat  cHeight = [FPModuleHelper configureTextHeight:self.content font:self.font widht:width];
           CGFloat  sHeight = [FPModuleHelper configureTextHeightText:self.content font:self.font widht:width numberOfLines:self.numberOfLines];
            _height = sHeight > cHeight ? cHeight : sHeight;
        }
    }
    return _height;
}
@end
