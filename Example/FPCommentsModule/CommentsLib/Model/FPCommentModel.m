//
//  FPCommentModel.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentModel.h"
#import "FPLinkModel.h"
#import <UIKit/UIKit.h>
#import "FPCommentHelper.h"
static TTTAttributedLabel *label;
#define kSWidth [UIScreen mainScreen].bounds.size.width
@implementation FPCommentUserInfoModel
@synthesize userId = _userId;
@synthesize time = _time;
@synthesize headUrl = _headUrl;
@synthesize userName = userName;
@synthesize height = _height;
- (CGFloat)height{return 77;}
@end
@implementation  FPCommentExpandInfoModel
@synthesize expand = _expand;
@synthesize height = _height;
@synthesize title = _title;
- (void)setExpand:(BOOL)expand{
    _expand = expand;
    self.title = expand ? @"收起" : @"全文";
}
- (CGFloat)height{return 20;}
@end
@implementation FPCommentContentModel
@synthesize content = _content;
@synthesize height = _height;
@synthesize numberOfLines = _numberOfLines;
- (CGFloat)height{
    if (self.content != nil && self.content.length > 0) {
        CGFloat width = kSWidth - 68 - 16;
        if (self.numberOfLines == 0) {
            _height = [FPCommentHelper configurTextHeight:self.content font:kContentFont widht:width];
        }else{
          CGFloat  cHeight = [FPCommentHelper configurTextHeight:self.content font:kContentFont widht:width];
           CGFloat  sHeight = [FPCommentHelper configurTextHeightText:self.content font:kContentFont widht:width numberOfLines:self.numberOfLines];
            _height = sHeight > cHeight ? cHeight : sHeight;
        }
        _height += 5 * 2;
    }
    return _height;
}
@end
@implementation FPCommentPictureModel
@synthesize pictures = _pictures;
@synthesize height = _height;
@synthesize line = _line;
@synthesize column = _column;
@synthesize itemWidth = _itemWidth;
@synthesize itemHeight = _itemHeight;
- (CGFloat)height{
    if (_height == 0 && self.pictures.count != 0) {
        _height = self.itemHeight * self.line + (self.line - 1) * 10 + 5 * 2;
    }
    return _height;
}
@end
@implementation FPCommentReplayContainerModel
@synthesize comments = _comments;
@synthesize height = _height;
- (BOOL)isEqualToDiffableObject:(nullable id<IGListDiffable>)object {
    FPCommentReplayContainerModel *obj = (FPCommentReplayContainerModel*)object;
    if (![obj isKindOfClass:[FPCommentReplayContainerModel class]]) return NO;
    if (![self isEqual:obj]) return NO;
    if (self.comments.count != obj.comments.count) return NO;
    return [self.diffId isEqualToString:obj.diffId];
}
- (CGFloat)height{
    if (_height == 0 && self.comments.count > 0) {
        __block CGFloat height = 0;
        [self.comments enumerateObjectsUsingBlock:^(id<FPCommentReplayProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            height += obj.height;
        }];
        height += (6 * 2  + 5 * 2);
        _height = height;
    }
    return _height;
}
@end
@implementation FPCommentReplayModel
@synthesize commentId = _commentId;
@synthesize commentUserId = _commentUserId;
@synthesize commentUserName = _commentUserName;
@synthesize commentByUserId = _commentByUserId;
@synthesize commentByUserName = _commentByUserName;
@synthesize commentText = _commentText;
@synthesize parentId = _parentId;
@synthesize height = _height;
@synthesize attrText = _attrText;
@synthesize links = _links;
- (CGFloat)height{
    CGFloat width = kSWidth - 68 - 12 * 2 - 20;
    if (_height == 0) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            label = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
            label.numberOfLines = 0;
        });
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 3;
        [label setText:self.attrText.string afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            [mutableAttributedString setAttributes:@{NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle} range:NSMakeRange(0, mutableAttributedString.length)];
            return mutableAttributedString;
        }];
       _height =  ceil([label sizeThatFits:CGSizeMake(width, MAXFLOAT)].height);                
        _height += 3;
    }
    return _height;
}
- (NSAttributedString *)attrText{
    if (!_attrText && _commentText && _commentText.length > 0) {
        NSMutableAttributedString *mAttr = [[NSMutableAttributedString alloc]initWithString:@"" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}];
        NSMutableArray *links = [NSMutableArray array];
        UIColor *highColor = [UIColor colorWithRed:0 green:120/255.0 blue:1 alpha:1];
        UIColor *norColor = [UIColor blackColor];
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 3;
        if (self.commentUserName && self.commentUserName.length > 0) {//回复人
                NSAttributedString *userAttr = [[NSMutableAttributedString alloc]initWithString:self.commentUserName];
                NSRange userNameRange = NSMakeRange(0,self.commentUserName.length);
                FPLinkModel *model = [FPLinkModel new];
                model.range = userNameRange;
                model.mid = self.commentUserId;
                model.text = self.commentUserName;
                model.enableTap = YES;
                model.configure = @{NSForegroundColorAttributeName : highColor,NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle};
                [links addObject:model];
                [mAttr appendAttributedString:userAttr];
        }
        
        if (mAttr.length > 0 && self.commentByUserName && self.commentByUserName.length > 0) {//
                NSAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@" 回复 "];
                NSRange range = NSMakeRange(mAttr.length,attr.length);
                FPLinkModel *model = [FPLinkModel new];
                model.range = range;
                model.enableTap = NO;
                model.text = attr.string;
                model.configure = @{NSForegroundColorAttributeName : norColor,NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle};
                [links addObject:model];
                [mAttr appendAttributedString:attr];
        }

        if (self.commentByUserName && self.commentByUserName.length > 0) {
                NSAttributedString *commentAttr = [[NSMutableAttributedString alloc]initWithString:self.commentByUserName];
                NSRange range = NSMakeRange(mAttr.string.length,self.commentByUserName.length);
                FPLinkModel *model = [FPLinkModel new];
                model.range = range;
                model.mid = self.commentByUserId;
                model.text = self.commentByUserName;
                model.enableTap = YES;
                model.configure = @{NSForegroundColorAttributeName : highColor,NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle};
                [links addObject:model];
            [mAttr appendAttributedString:commentAttr];
        }
        
        if (mAttr.length > 0) {//
                NSAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:@" : "];
                NSRange range = NSMakeRange(mAttr.length,attr.length);
                FPLinkModel *model = [FPLinkModel new];
                model.range = range;
                model.enableTap = NO;
                model.text = attr.string;
                model.configure = @{NSForegroundColorAttributeName : norColor,NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle};
                [links addObject:model];
                [mAttr appendAttributedString:attr];
        }


        if (self.commentText && self.commentText.length > 0) {
            NSAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:self.commentText];
            NSRange range = NSMakeRange(mAttr.length,attr.length);
            FPLinkModel *model = [FPLinkModel new];
            model.range = range;
            model.mid = self.commentId;
            model.text = attr.string;
            model.enableTap = NO;
            model.configure = @{NSForegroundColorAttributeName : norColor,NSFontAttributeName : kCommentFont,NSParagraphStyleAttributeName:paragraphStyle};
            [links addObject:model];
            [mAttr appendAttributedString:attr];
        }
        self.links = links;
        _attrText = mAttr;
        
    }
    return _attrText;
}
@end

@implementation FPCommentModel
@synthesize comments = _comments;
@synthesize userId = _userId;
@synthesize content = _content;
@synthesize time = _time;
@synthesize headUrl = _headUrl;
@synthesize userName = _userName;
@synthesize commentId = _commentId;
@synthesize pictures = _pictures;
@synthesize userInfo = _userInfo;
@synthesize contentInfo = _contentInfo;
@synthesize picturesInfo = _picturesInfo;
@synthesize commentsInfo = _commentsInfo;
@synthesize expandInfo = _expandInfo;
@synthesize showExpandRow = _showExpandRow;
@synthesize numberOfLines = _numberOfLines;
@synthesize cellHeight = _cellHeight;
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfLines = 0;
    }
    return self;
}
- (CGFloat)cellHeight{
    if (_cellHeight == 0) {
        __block CGFloat height = 0;
        height += self.userInfo.height;
        height += self.contentInfo.height;
        height += self.picturesInfo.height;
        height += self.commentsInfo.height;
        height += (self.showExpandRow ? self.expandInfo.height : 0);
        _cellHeight = height;
    }
    return _cellHeight;
}
- (id<FPCommentUserInfoProtocal>)userInfo{
    if (!_userInfo) {
        FPCommentUserInfoModel *model = [FPCommentUserInfoModel new];
        model.userId = self.userId;
        model.userName = self.userName;
        model.time = self.time;
        model.headUrl = self.headUrl;
        _userInfo = model;
    }
    return _userInfo;
}
- (id<FPCommentContentProtocal>)contentInfo{
    if (!_contentInfo) {
        _contentInfo = [FPCommentContentModel new];
        _contentInfo.content = self.content;
        _contentInfo.numberOfLines = self.numberOfLines;
    }
    return _contentInfo;
}
- (BOOL)showExpandRow{
    if (self.numberOfLines == 0) return NO;
    CGFloat width = kSWidth - 68 - 20;
    CGFloat  numberOfHeight = [FPCommentHelper configurTextHeightText:self.content font:kContentFont widht:width numberOfLines:self.numberOfLines];
    CGFloat fullHeight = [FPCommentHelper configurTextHeight:self.content font:kContentFont widht:width];
    return fullHeight > numberOfHeight;
}
- (id<FPCommentExpandProtocal>)expandInfo{
    if (!_expandInfo) {
        FPCommentExpandInfoModel *expandInfo = [FPCommentExpandInfoModel new];
        expandInfo.expand = NO;
        _expandInfo = expandInfo;
    }
    return _expandInfo;
}
- (void)setNumberOfLines:(int)numberOfLines{
    _numberOfLines = numberOfLines;
    if (!_contentInfo) return;
    self.contentInfo.numberOfLines = numberOfLines;
}
- (id<FPCommentPictureProtocal>)picturesInfo{
    if (!_picturesInfo) {
        _picturesInfo = [FPCommentPictureModel new];
        _picturesInfo.column = 3;
        _picturesInfo.line = (int)(self.pictures.count - 1)/_picturesInfo.column + 1;
        CGFloat itemWidth = ceil ((kSWidth - 68 - 20 - (_picturesInfo.column - 1) * 10)/_picturesInfo.column);
        _picturesInfo.itemWidth = itemWidth;
        _picturesInfo.itemHeight = itemWidth;
        _picturesInfo.pictures = self.pictures;
    }
    return _picturesInfo;
}
- (id<FPCommentReplayContainerProtocal>)commentsInfo{
    if (!_commentsInfo) {
        _commentsInfo = [FPCommentReplayContainerModel new];
        _commentsInfo.comments = self.comments;
    }
    return _commentsInfo;
}
- (void)setComments:(NSMutableArray<id<FPCommentReplayProtocal>> *)comments{
    _comments = comments;
    //清缓存高度
    self.cellHeight = 0;
    self.commentsInfo = nil;
}
@end

