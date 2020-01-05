//
//  FPCommentCell.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentCell.h"

@implementation FPCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
- (void)setModel:(id<FPCommentProtocal>)model{
    _model = model;
}
@end
