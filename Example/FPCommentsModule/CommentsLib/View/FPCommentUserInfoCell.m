//
//  FPCommentUserInfoCell.m
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentUserInfoCell.h"

@implementation FPCommentUserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)commentBtnAction:(id)sender {
    if (self.commentBlock) {
        self.commentBlock();
    }
}

@end
