//
//  FPCommentExpandSectionController.m
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentExpandSectionController.h"
#import "FPCommentProtocal.h"
#import "LeftBtnCollectionCell.h"

@interface FPCommentExpandSectionController()
@property (nonatomic,strong)id<FPCommentExpandProtocal> model;
@end
@implementation FPCommentExpandSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.inset = UIEdgeInsetsMake(0, 68, 0, 20);
    }
    return self;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width - 68 - 20, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    LeftBtnCollectionCell *cell = [self.collectionContext dequeueReusableCellWithNibName:@"LeftBtnCollectionCell" bundle:nil forSectionController:self atIndex:index];
    [cell.leftBtn setTitle:self.model.title forState:UIControlStateNormal];
    __weak typeof(self) weakSelf = self;
    __weak typeof(cell) weakCell = cell;
    cell.tapBlock = ^(UIButton * _Nonnull btn) {
        if (weakSelf.selectBlock) {
            weakSelf.selectBlock(weakSelf.model,weakSelf);
        }
        [weakCell.leftBtn setTitle:weakSelf.model.title forState:UIControlStateNormal];
    };
    return cell;
}
- (void)didUpdateToObject:(id<FPCommentExpandProtocal>)object{
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
}
@end
