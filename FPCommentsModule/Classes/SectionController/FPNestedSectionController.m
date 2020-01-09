//
//  FPNestedSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import "FPNestedSectionController.h"
#import "FPNestedCollectionViewCell.h"
@interface FPNestedSectionController()<IGListAdapterDataSource>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPListModuleProtocoal> model;
@end
@implementation FPNestedSectionController
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController workingRangeSize:0];
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
    FPNestedCollectionViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:FPNestedCollectionViewCell.class forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    if ([self respondsToSelector:@selector(configureCellBlock)] && self.configureCellBlock) {
        self.configureCellBlock(self.model, cell);
    }
    return cell;
}
- (void)didUpdateToObject:(id<FPListModuleProtocoal>)object{
    self.inset = object.inset;
    self.model = object;
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {return nil;}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id <FPSectionModelProtocal,FPSectionControllerProtocal>)object {
    if ([object respondsToSelector:@selector(sectionController)] && object.sectionController) {
        return object.sectionController;
    }else{
        return object.sectionControllerBlock(self.model);
    }
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.model.subSectionModels;
}
@end


@interface FPListSectionController()
@property (nonatomic,strong)id<FPSectionModelProtocal,FPSectionControllerProtocal,FPDequeueReusableCellProtocal> model;
@end
@implementation FPListSectionController
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right;
    }
    return CGSizeMake(width, self.model.height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell;
    if (self.model.nibName && self.model.bundle) {
        cell = [self.collectionContext dequeueReusableCellWithNibName:self.model.nibName bundle:self.model.bundle forSectionController:self atIndex:index];
    }else{
        cell = [self.collectionContext dequeueReusableCellOfClass:self.model.className forSectionController:self atIndex:index];
    }
    if (self.configureCellBlock) self.configureCellBlock(self.model, cell);
    return cell;
}
-(void)didUpdateToObject:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPDequeueReusableCellProtocal>)object{
    self.inset = object.inset;
    self.model = object;
}
@end

