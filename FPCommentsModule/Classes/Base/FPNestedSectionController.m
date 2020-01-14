//
//  FPNestedSectionController.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import "FPNestedSectionController.h"
#import "FPNestedCollectionViewCell.h"
@interface FPBaseSectionController()<IGListSupplementaryViewSource>
@property (nonatomic,strong)id<FPSectionModelProtocal,FPSectionControllerProtocal> model;
@end
@implementation FPBaseSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.supplementaryViewSource = self;
    }
    return self;
}
#pragma supplementaryViewSource
- (NSArray<NSString *> *)supportedElementKinds{
    NSMutableArray *elementKinds = [NSMutableArray array];
    if ([self.model respondsToSelector:@selector(header)] && self.model.header) {
        [elementKinds addObject: UICollectionElementKindSectionHeader];
        }
    if ([self.model respondsToSelector:@selector(footer)] && self.model.footer) {
    [elementKinds addObject: UICollectionElementKindSectionFooter];
    }
    return elementKinds;
}
- (__kindof UICollectionReusableView *)viewForSupplementaryElementOfKind:(NSString *)elementKind
                                                                 atIndex:(NSInteger)index{
    id<FPConfigureReusableViewProtocal> model = [elementKind isEqualToString:UICollectionElementKindSectionHeader] ? self.model.header : self.model.footer;
    UICollectionReusableView *supplementaryView = [self viewForSupplementaryElementOfKind:elementKind atIndex:index from:model];
    if (self.configureSupplementaryViewBlock) {
        self.configureSupplementaryViewBlock(self.model, supplementaryView, self);
    }
    return supplementaryView;
}
- (UICollectionReusableView*)viewForSupplementaryElementOfKind:(NSString *)elementKind
                                                       atIndex:(NSInteger)index from:(id<FPConfigureReusableViewProtocal>)fromModel{
    UICollectionReusableView *supplementaryView;
    if ([fromModel respondsToSelector:@selector(nibName)] &&
        [fromModel respondsToSelector:@selector(bundle)] &&
        fromModel.nibName && fromModel.bundle) {
        supplementaryView = [self.collectionContext dequeueReusableSupplementaryViewOfKind:elementKind forSectionController:self nibName:fromModel.nibName bundle:fromModel.bundle atIndex:index];

    }else if([fromModel respondsToSelector:@selector(class_name)] && fromModel.class_name){
        supplementaryView = [self.collectionContext dequeueReusableSupplementaryViewOfKind:elementKind forSectionController:self class:fromModel.class_name atIndex:index];
    }
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        supplementaryView.backgroundColor = [UIColor redColor];
    }else{
        supplementaryView.backgroundColor = [UIColor orangeColor];
    }
    return supplementaryView;
}
- (CGSize)sizeForSupplementaryViewOfKind:(NSString *)elementKind
                                 atIndex:(NSInteger)index{
    CGFloat height = self.collectionContext.containerSize.height;
    CGFloat width = self.collectionContext.containerSize.width;
    if ([elementKind isEqualToString:UICollectionElementKindSectionHeader]) {
        if ([self.model.header respondsToSelector:@selector(width)]) {
            width = self.model.header.width;
        }
        if ([self.model.header respondsToSelector:@selector(height)]) {
            height = self.model.header.height;
        }
    }else if ([elementKind isEqualToString:UICollectionElementKindSectionFooter]){
        if ([self.model.footer respondsToSelector:@selector(width)]) {
            width = self.model.footer.width;
        }
        if ([self.model.footer respondsToSelector:@selector(height)]) {
            height = self.model.footer.height;
        }
    }
    return CGSizeMake(width, height);
}
-(void)didUpdateToObject:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)object{
    self.inset = object.sectionInset;
    self.model = object;
}

- (void)didSelectItemAtIndex:(NSInteger)index{
    if ([self respondsToSelector:@selector(didSelectItemBlock)] && self.didSelectItemBlock) {
        self.didSelectItemBlock(self, self.model, index);
    }
}
@end



@interface FPNestedSectionController()<IGListAdapterDataSource>
@property (nonatomic,readwrite)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPNestedSectionControllerProtocal> model;
@end
@implementation FPNestedSectionController
@dynamic model;
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController workingRangeSize:0];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    CGFloat height = self.model.height;
    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right;
    }
    if (height <= 0) {
        height = self.collectionContext.containerSize.height - self.inset.top - self.inset.bottom;
    }
    return CGSizeMake(width, height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPNestedCollectionViewCell* cell = [self.collectionContext dequeueReusableCellOfClass:FPNestedCollectionViewCell.class forSectionController:self atIndex:index];
    if ([self.model respondsToSelector:@selector(collectionViewContentInset)]) {
        cell.collectionView.contentInset = self.model.collectionViewContentInset;
    }
    self.adapter.collectionView = cell.collectionView;
    [self.adapter reloadDataWithCompletion:nil];
    if ([self respondsToSelector:@selector(configureCellBlock)] && self.configureCellBlock) {
        self.configureCellBlock(self.model, cell,self);
    }
    return cell;
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@interface FPListSectionController()
@property (nonatomic,strong)id<FPSectionModelProtocal,FPSectionControllerProtocal,FPLoadReusableViewProtocal> model;
@end
@implementation FPListSectionController
@dynamic model;
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGFloat width = self.model.width;
    CGFloat height = self.model.height;

    if (width <= 0) {
        width = self.collectionContext.containerSize.width - self.inset.left - self.inset.right- self.collectionContext.containerInset.left - self.collectionContext.containerInset.right;
    }
    if (height <= 0) {
        height = self.collectionContext.containerSize.height - self.inset.top - self.inset.bottom - self.collectionContext.containerInset.top - self.collectionContext.containerInset.bottom;
    }

    return CGSizeMake(width, height);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    UICollectionViewCell *cell;
    if ([self.model respondsToSelector:@selector(nibName)] &&
        [self.model respondsToSelector:@selector(bundle)] &&
        self.model.nibName && self.model.bundle) {
        cell = [self.collectionContext dequeueReusableCellWithNibName:self.model.nibName bundle:self.model.bundle forSectionController:self atIndex:index];
    }else{
        cell = [self.collectionContext dequeueReusableCellOfClass:self.model.class_name forSectionController:self atIndex:index];
    }
    if (self.configureCellBlock) self.configureCellBlock(self.model, cell,self);
    return cell;
}
@end


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



@interface FPNumberOfItemsSectionController()
@property (nonatomic,strong)id<FPNumberOfItemsModelProtocal> model;
@end
@implementation FPNumberOfItemsSectionController
- (NSInteger)numberOfItems{
    return self.model.itemModels.count;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    id<FPWidthHeightProtocal> model = self.model.itemModels[index];
    CGSize size = CGSizeZero;
    if (![model respondsToSelector:@selector(size)] || CGSizeEqualToSize(model.size, CGSizeZero)) {
        if ([self.model respondsToSelector:@selector(size)] &&  !CGSizeEqualToSize(self.model.size, CGSizeZero)) {
            size = self.model.size;
        }
    }
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        return self.collectionContext.containerSize;
    }
    
    if (size.width <= 0) {
        return CGSizeMake(self.collectionContext.containerSize.width, size.height);
    }
    if (size.height <= 0) {
        return CGSizeMake(size.width, self.collectionContext.containerSize.height);
    }
    return size;
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index{
    id<FPWidthHeightProtocal,FPLoadReusableViewProtocal> model = self.model.itemModels[index];
    UICollectionViewCell *cell = [self dequeueCell:model index:index];
    if (!cell) {
        cell = [self dequeueCell:self.model index:index];
    }
    if (self.configureCellBlock) self.configureCellBlock(model, cell,self);
    return cell;
}
- (UICollectionViewCell*)dequeueCell:(id<FPLoadReusableViewProtocal>)model index:(NSInteger)index{
    UICollectionViewCell *cell;
    if ([model respondsToSelector:@selector(nibName)] &&
        [model respondsToSelector:@selector(bundle)] &&
        model.nibName && model.bundle) {
        cell = [self.collectionContext dequeueReusableCellWithNibName:model.nibName bundle:model.bundle forSectionController:self atIndex:index];
    }else if([model respondsToSelector:@selector(class_name)] && model.class_name){
        cell = [self.collectionContext dequeueReusableCellOfClass:model.class_name forSectionController:self atIndex:index];
    }
    return cell;
}
-(void)didUpdateToObject:(id<FPNumberOfItemsModelProtocal>)object{
    if ([object respondsToSelector:@selector(inset)]) {
        self.inset = object.inset;
    }
    if ([object respondsToSelector:@selector(minimumLineSpacing)]) {
        self.minimumLineSpacing = object.minimumLineSpacing;
    }
    if ([object respondsToSelector:@selector(minimumInteritemSpacing)]) {
        self.minimumInteritemSpacing = object.minimumInteritemSpacing;
    }
    self.model = object;
}
@end
