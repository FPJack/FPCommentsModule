//
//  FPCommentSectionController.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//
#import "FPCommentSectionController.h"
#import "FPCommentReplySectionController.h"
#import "FPCommentCell.h"
#import "FPCommentProtocal.h"
#import "FPCommentUserInfoCell.h"
#import "FPCommentContentCell.h"
#import "CollectionImageCell.h"
#import "FPReplyContainerCell.h"
#import "FPCommentUserInfSectionController.h"
#import "FPCommentContentSectionController.h"
#import "FPCommentImgSectionController.h"
#import "FPCommentReplayContainerController.h"
#import "FPCommentExpandSectionController.h"
@interface FPCommentSectionController()<IGListAdapterDataSource,IGListDisplayDelegate,IGListWorkingRangeDelegate>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)id<FPCommentProtocal> model;
@property (nonatomic,strong)FPCommentUserInfSectionController *userSC;
@property (nonatomic,strong)FPCommentContentSectionController *contentSC;
@property (nonatomic,strong)FPCommentImgSectionController *imgViewSC;
@property (nonatomic,strong)FPCommentReplayContainerController *replaySC;
@property (nonatomic,strong)FPCommentExpandSectionController *expandSC;

@end
@implementation FPCommentSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.displayDelegate = self;
        self.workingRangeDelegate = self;
    }
    return self;
}
- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerWillEnterWorkingRange:(IGListSectionController *)sectionController{
    NSLog(@"sectionControllerWillEnterWorkingRange-----%zd",self.section);

}
- (void)listAdapter:(IGListAdapter *)listAdapter sectionControllerDidExitWorkingRange:(IGListSectionController *)sectionController{
    NSLog(@"sectionControllerDidExitWorkingRange-----%zd",self.section);

}
- (void)listAdapter:(IGListAdapter *)listAdapter willDisplaySectionController:(IGListSectionController *)sectionController
   cell:(UICollectionViewCell *)cell
            atIndex:(NSInteger)index{
//    NSLog(@"will ----%@",self.model.content);
}
- (void)listAdapter:(IGListAdapter *)listAdapter didEndDisplayingSectionController:(IGListSectionController *)sectionController
   cell:(UICollectionViewCell *)cell
            atIndex:(NSInteger)index{
//    NSLog(@"end ----%@",self.model.content);

}

- (void)listAdapter:(nonnull IGListAdapter *)listAdapter didEndDisplayingSectionController:(nonnull IGListSectionController *)sectionController {
    
}


- (void)listAdapter:(nonnull IGListAdapter *)listAdapter willDisplaySectionController:(nonnull IGListSectionController *)sectionController {
    
}


- (FPCommentContentSectionController *)contentSC{
    if (!_contentSC) {
        _contentSC = [FPCommentContentSectionController new];
    }
    return _contentSC;
}
- (FPCommentUserInfSectionController *)userSC{
    if (!_userSC) {
        _userSC = [FPCommentUserInfSectionController new];
        __weak typeof(self) weakSelf = self;
        _userSC.commentBlock = ^(id<FPCommentUserInfoProtocal>  _Nonnull model) {
            if ([weakSelf.delegate respondsToSelector:@selector(writeCommentEvent:sectionController:)]) {
                [weakSelf.delegate writeCommentEvent:weakSelf.model sectionController:weakSelf.userSC];
            }
        };
    }
    return _userSC;
}
- (FPCommentReplayContainerController *)replaySC{
    if (!_replaySC) {
        _replaySC = [FPCommentReplayContainerController new];
        __weak typeof(self) weakSelf = self;
        _replaySC.replayBlock = ^(id<FPCommentReplayProtocal>  _Nonnull model) {
            if ([weakSelf.delegate respondsToSelector:@selector(replayCommentEvent:model:sectionController:)]) {
                [weakSelf.delegate replayCommentEvent:model model:weakSelf.model sectionController:weakSelf.replaySC];
            }
        };
        _replaySC.userInfoBlock = ^(id<FPLinkProtocal>  _Nonnull link) {
            if ([weakSelf.delegate respondsToSelector:@selector(userInfoEvent:model:sectionController:)]) {
                [weakSelf.delegate userInfoEvent:link model:weakSelf.model sectionController:weakSelf.replaySC];
            }
        };
    }
    return _replaySC;
}
- (FPCommentExpandSectionController *)expandSC{
    if (!_expandSC) {
        _expandSC = [FPCommentExpandSectionController new];
        __weak typeof(self) weakSelf = self;
        _expandSC.selectBlock = ^(id<FPCommentExpandProtocal>  _Nonnull model, FPCommentExpandSectionController * _Nonnull SC) {
            model.expand = !model.expand;
            int numberOfLines = model.expand ? 0 : weakSelf.model.numberOfLines;
            //两个模型不一样，有时间再回来处理
            weakSelf.contentSC.model.numberOfLines = numberOfLines;
            weakSelf.model.contentInfo.numberOfLines = numberOfLines;
            weakSelf.model.cellHeight = 0;
            if (model.expand) weakSelf.contentSC.numberOfLines = numberOfLines;
            [weakSelf.contentSC.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
            } completion:^(BOOL finished) {
            if (!model.expand) weakSelf.contentSC.numberOfLines = numberOfLines;
            }];
            [weakSelf.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
            } completion:^(BOOL finished) {
            }];
            if ([weakSelf.delegate respondsToSelector:@selector(expendEvent:sectionController:)]) {
                [weakSelf.delegate expendEvent:model sectionController:SC];
            }
        };
    }
    return _expandSC;
}
- (FPCommentImgSectionController *)imgViewSC{
    if (!_imgViewSC) {
        _imgViewSC = [FPCommentImgSectionController new];
    }
    return _imgViewSC;
}
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
    return CGSizeMake(self.collectionContext.containerSize.width, self.model.cellHeight);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    FPCommentCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"FPCommentCell" bundle:nil forSectionController:self atIndex:index];
    self.adapter.collectionView = cell.collectionView;
    [self.adapter reloadDataWithCompletion:nil];

    return cell;
}
- (void)didUpdateToObject:(id<FPCommentProtocal>)object{
    self.model = object;
    
}
- (void)didSelectItemAtIndex:(NSInteger)index{
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    if ([object isEqual:self.model.userInfo]) return self.userSC;
    if ([object isEqual:self.model.contentInfo]) return self.contentSC;
    if ([object isEqual:self.model.expandInfo]) return self.expandSC;
    if ([object isEqual:self.model.picturesInfo]) return self.imgViewSC;
    if ([object isEqual:self.model.commentsInfo]) return self.replaySC;
    return [FPCommentReplayContainerController new];
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    NSMutableArray *arr = [NSMutableArray array];
    if (self.model.userId && self.model.userId.length > 0) [arr addObject:self.model.userInfo];
    if (self.model.content && self.model.content.length > 0) [arr addObject:self.model.contentInfo];
    if (self.model.showExpandRow) [arr addObject:self.model.expandInfo];
    if (self.model.pictures.count > 0) [arr addObject:self.model.picturesInfo];
    if (self.model.comments.count > 0) [arr addObject:self.model.commentsInfo];
    return arr;
}
@end
