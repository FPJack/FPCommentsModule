//
//  FPCommentToolView.m
//  test
//
//  Created by fanpeng on 2019/11/20.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentToolView.h"

@implementation FPCommentToolView
- (void)awakeFromNib{
    [super awakeFromNib];
    
//    UIView *view = self.bagView;
//    view.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    view.layer.shadowColor = [UIColor colorWithRed:230/255.0 green:225/255.0 blue:230/255.0 alpha:0.42].CGColor;
//    view.layer.shadowOffset = CGSizeMake(0,-1);
//    view.layer.shadowOpacity = 1;
//    view.layer.shadowRadius = 4;
}
- (IBAction)btnAction:(UIButton*)sender {
    if (self.tapAction) {
        self.tapAction(sender,sender.tag);
    }
}
@end
