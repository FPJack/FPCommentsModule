//
//  FPCommentReplyCell.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentReplyCell.h"
#import <Masonry.h>
@interface FPCommentReplyCell()<TTTAttributedLabelDelegate>

@end
@implementation FPCommentReplyCell
- (TTTAttributedLabel *)commentLab{
    if (!_commentLab) {
        _commentLab = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        _commentLab.numberOfLines = 0;
        _commentLab.userInteractionEnabled = YES;
    }
   return _commentLab;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addSubview:self.commentLab];
    [self.commentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.right.mas_equalTo(0);
    }];
}
- (void)setModel:(id<FPCommentReplayProtocal>)model{
    _model = model;
    self.commentLab.linkAttributes = @{@(NO):(NSString *)kCTUnderlineStyleAttributeName,[UIColor blackColor] : (NSString*)kCTForegroundColorAttributeName};
    self.commentLab.activeLinkAttributes = @{@(YES):(NSString *)kCTUnderlineStyleAttributeName,[UIColor redColor] : (NSString*)kCTForegroundColorAttributeName};
    self.commentLab.delegate = self;
    [self.commentLab setText:model.attrText.string afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        [model.links enumerateObjectsUsingBlock:^(id<FPLinkProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [mutableAttributedString setAttributes:obj.configure range:obj.range];
        }];
        return mutableAttributedString;
    }];
    //添加超链接
    [model.links enumerateObjectsUsingBlock:^(id<FPLinkProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.enableTap){
            [self.commentLab addLinkToTransitInformation:@{@"obj" : obj} withRange:obj.range];
        }
    }];
}
- (void)attributedLabel:(TTTAttributedLabel *)label
didSelectLinkWithTransitInformation:(NSDictionary *)components{
    id<FPLinkProtocal> obj = components[@"obj"];
    if (self.userInfoBlock) {
        self.userInfoBlock(obj);
    }
}
@end
