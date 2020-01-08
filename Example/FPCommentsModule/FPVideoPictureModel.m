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
        NSInteger column = self.column <= 0 ? 1 : self.column;
        NSInteger line = (self.sources.count - 1)/column + 1;
        CGFloat itemWidth = (self.width - (column - 1) * self.minimumInteritemSpacing)/column;
        CGFloat itemHeight = itemWidth * line;
        CGFloat spaceHeight = (line - 1) * self.minimumLineSpacing;
        CGFloat insetHeight = self.sectionInset.top + self.sectionInset.bottom;
        _height = itemHeight + spaceHeight + insetHeight;
    }
    return _height;
}
@end
