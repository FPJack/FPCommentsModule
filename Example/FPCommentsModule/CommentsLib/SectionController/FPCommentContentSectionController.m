//
//  FPCommentContentSectionController.m
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentContentSectionController.h"
#import "FPCommentContentCell.h"
#import "FPCommentModel.h"
@interface FPCommentContentSectionController()
@end
@implementation FPCommentContentSectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.collectionContext.containerSize.width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
        FPCommentContentCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"FPCommentContentCell" bundle:nil forSectionController:self atIndex:index];
        cell.contentLab.text = self.model.content;
        cell.contentLab.numberOfLines = self.model.numberOfLines;
        cell.contentLab.font = kContentFont;
        return cell;
}
- (void)setNumberOfLines:(int)numberOfLines{
    _numberOfLines = numberOfLines;
    FPCommentContentCell *cell = [self.collectionContext cellForItemAtIndex:0 sectionController:self];
    cell.contentLab.numberOfLines = numberOfLines;
    [cell.contentLab layoutIfNeeded];
}
- (void)didUpdateToObject:(id<FPCommentContentProtocal>)object{
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
}
@end
