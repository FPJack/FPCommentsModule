//
//  FPVideoPictureModel.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/8.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import "FPVideoPictureModel.h"

@implementation FPVideoPictureModel
@synthesize height = _height;
- (CGFloat)height{
    if (!_height) {
        if (self.sources.count == 1 && !CGSizeEqualToSize(self.oneItemSize, CGSizeZero)) {
            _height = self.oneItemSize.height;
        }else{
            NSInteger column = self.column <= 0 ? 1 : self.column;
            NSInteger line = (self.sources.count - 1)/column + 1;
            CGFloat itemWidth = (self.width - (column - 1) * self.minimumInteritemSpacing)/column;
            CGFloat itemHeight = itemWidth * line;
            CGFloat spaceHeight = (line - 1) * self.minimumLineSpacing;
            _height = itemHeight + spaceHeight;
        }
        
    }
    return _height;
}
@end
