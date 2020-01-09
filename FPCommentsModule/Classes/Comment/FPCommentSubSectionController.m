//
//  FPCommentSubSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/6.
//

#import "FPCommentSubSectionController.h"
#import "FPCommentSubProtocal.h"
#import "FPCommentSubCell.h"
@interface FPCommentSubSectionController()
@property (nonatomic,strong)id<FPCommentSubProtocal> model;

@end
@implementation FPCommentSubSectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right;
    }
    return CGSizeMake(width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPCommentSubCell* cell = [self.collectionContext dequeueReusableCellOfClass:FPCommentSubCell.class forSectionController:self atIndex:index];
    cell.model = self.model;
    __weak typeof(self) weakSelf = self;
    cell.tapLinkBlock = ^(id<FPHyperlinkProtocal>  _Nonnull link) {
        if (weakSelf.tapLinkBlock) weakSelf.tapLinkBlock(weakSelf, link);
    };
    return cell;
}
- (void)didUpdateToObject:(id<FPCommentSubProtocal>)object{
    self.inset = object.inset;
    self.model = object;
}
@end
