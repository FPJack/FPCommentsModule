//
//  FPBottomCommentView.m
//  test
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPBottomCommentView.h"

@implementation FPBottomCommentView
- (void)awakeFromNib{
    [super awakeFromNib];
//    self.layer.masksToBounds
}
- (IBAction)tapAction:(id)sender {
    if (self.tapCommentBlock) {
        self.tapCommentBlock();
    }
}
@end
