//
//  FPCommentContainerSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//
#import "FPCommentContainerSectionController.h"
#import "FPCommentSubProtocal.h"
#import <IGListKit/IGListKit.h>
#import "FPCommentContainerCell.h"
@interface FPCommentContainerSectionController ()<IGListAdapterDataSource>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPListModuleProtocoal> model;
@end
@implementation FPCommentContainerSectionController
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController workingRangeSize:50];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right;
    }
    return CGSizeMake(width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPCommentContainerCell* cell = [self.collectionContext dequeueReusableCellOfClass:FPCommentContainerCell.class forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    [self.adapter reloadDataWithCompletion:nil];
    return cell;
}
- (void)didUpdateToObject:(id<FPListModuleProtocoal>)object{
    self.inset = object.inset;
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%zd",index);
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id<FPListModuleProtocoal>)object {
    return object.sectionController;
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.model.subSectionModels;
}
@end
