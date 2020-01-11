//
//  FPCommentReplySectionController.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentReplySectionController.h"
#import "FPCommentReplyCell.h"
#import "FPTextViewInputView.h"

#define kSWidth [UIScreen mainScreen].bounds.size.width
@interface FPCommentReplySectionController()
@property (nonatomic,strong)id<FPCommentReplayProtocal> model;
@end
@implementation FPCommentReplySectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(kSWidth - 68 - 20 - 12 * 2,self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPCommentReplyCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"FPCommentReplyCell" bundle:nil forSectionController:self atIndex:index];
    cell.model = self.model;
    __weak typeof(self) weakSelf = self;
    cell.userInfoBlock = ^(id<FPLinkProtocal>  _Nonnull link) {
        if (self.userInfoBlock) weakSelf.userInfoBlock(link);
    };
    return cell;
}
- (void)didUpdateToObject:(id)object{
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
    if (self.replayBlock) {
        self.replayBlock(self.model);
    }
}
@end
