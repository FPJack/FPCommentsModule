//
//  FPVideoPictureSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/8.
//

#import "FPVideoPictureSectionController.h"
#import "FPVideoPictureProtocal.h"
@interface FPVideoPictureSectionController()
@property (nonatomic,strong)id <FPVideoPictureProtocal> model;
@property (nonatomic,strong)FPImageVideoCell *tableCell;
@end
@implementation FPVideoPictureSectionController
- (FPImageVideoCell *)tableCell{
    if (!_tableCell) {
        _tableCell = [[FPImageVideoCell alloc]initWithFrame:CGRectZero];
    }
    return _tableCell;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right;
    }
    return CGSizeMake(width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:UICollectionViewCell.class forSectionController:self atIndex:index];
    [cell.contentView addSubview:self.tableCell];
    self.tableCell.frame = CGRectMake(0, 0, [self sizeForItemAtIndex:index].width, [self sizeForItemAtIndex:index].height);
    {
        self.tableCell.source = self.model.sources;
        self.tableCell.type = self.model.type;
        self.tableCell.minimumLineSpacing = self.model.minimumLineSpacing;
        self.tableCell.minimumInteritemSpacing = self.model.minimumInteritemSpacing;
        self.tableCell.column = self.model.column;
        self.tableCell.sectionInset = self.model.sectionInset;
        self.tableCell.itemSize = self.model.oneItemSize;
    }
    __weak typeof(self) weakSelf = self;
    return cell;
}
- (void)didUpdateToObject:(id<FPVideoPictureProtocal>)object{
    self.inset = object.inset;
    self.model = object;
}

@end
