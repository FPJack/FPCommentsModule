//
//  FPMainSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPMainSectionController.h"
#import "FPMainCollectionCell.h"
#import "FPModuleProtocoal.h"
@interface FPMainSectionController()<IGListAdapterDataSource>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPListModuleProtocoal> model;
@end

@implementation FPMainSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
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
    FPMainCollectionCell* cell = [self.collectionContext dequeueReusableCellOfClass:FPMainCollectionCell.class forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    [self.adapter reloadDataWithCompletion:nil];
    return cell;
}
- (void)didUpdateToObject:(id<FPListModuleProtocoal>)object{
    self.inset = object.inset;
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id <FPSectionModelProtocal,FPSectionControllerProtocal>)object {
    return object.sectionController;
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.model.subSectionModels;
}
@end
