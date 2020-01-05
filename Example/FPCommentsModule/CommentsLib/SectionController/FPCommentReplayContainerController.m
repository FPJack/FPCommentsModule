//
//  FPCommentReplayContainerController.m
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentReplayContainerController.h"
#import "FPCommentReplySectionController.h"
#import "FPReplyContainerCell.h"
#import "FPCommentProtocal.h"
@interface FPCommentReplayContainerController ()<IGListAdapterDataSource>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPCommentReplayContainerProtocal> model;

@end
@implementation FPCommentReplayContainerController
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self.viewController workingRangeSize:50];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (NSInteger)numberOfItems{
    return 1;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    CGSize size =  CGSizeMake(self.collectionContext.containerSize.width, self.model.height);
    return size;
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPReplyContainerCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"FPReplyContainerCell" bundle:nil forSectionController:self atIndex:index];
    self.model.height = 0;
    self.adapter.collectionView = cell.collectionView;
    [self.adapter reloadDataWithCompletion:nil];
    return cell;
}
- (void)didUpdateToObject:(id<FPCommentReplayContainerProtocal>)object{
    self.model = object;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%zd",index);
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    FPCommentReplySectionController *SC = [FPCommentReplySectionController new];
    SC.replayBlock = self.replayBlock;
    SC.userInfoBlock = self.userInfoBlock;
    return SC;
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.model.comments;
}
@end
