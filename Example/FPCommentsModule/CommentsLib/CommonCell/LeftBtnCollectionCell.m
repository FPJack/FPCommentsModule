//
//  LeftBtnCollectionCell.m
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "LeftBtnCollectionCell.h"

@implementation LeftBtnCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)btnAction:(id)sender {
    if (self.tapBlock) {
        self.tapBlock(self.leftBtn);
    }
}

@end
