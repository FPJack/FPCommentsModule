//
//  FPCommentUserInfSectionController.m
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentUserInfSectionController.h"
#import "FPCommentUserInfoCell.h"
#import "FPCommentModel.h"
@interface FPCommentUserInfSectionController ()
@property (nonatomic,strong)id<FPCommentUserInfoProtocal> model;
@end
@implementation FPCommentUserInfSectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPCommentUserInfoCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"FPCommentUserInfoCell" bundle:nil forSectionController:self atIndex:index];
    cell.nameLab.text = self.model.userName;
    cell.timeLab.text = self.model.time;
//    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.model.headUrl] placeholderImage:kHeaderPlaceholderImg];
    __weak typeof(self) weakSelf = self;
    cell.commentBlock = ^{
        if (weakSelf.commentBlock) {
            weakSelf.commentBlock(weakSelf.model);
        }
    };
    return cell;
}
- (void)didUpdateToObject:(id<FPCommentUserInfoProtocal>)object{
    self.model = object;
}
@end
