//
//  FPCommentVC.m
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentVC.h"
#import <IGListKit/IGListKit.h>
#import "FPCommentSectionController.h"
#import "FPCommentModel.h"
#import "UIScrollView+Refresh.h"
#import "FPBottomCommentView.h"
@interface FPCommentVC ()<IGListAdapterDataSource,CommentEventDelegate>

@end

@implementation FPCommentVC
- (FPBottomCommentView *)bottomCommentView{
    if (!_bottomCommentView) {
        _bottomCommentView = [[NSBundle mainBundle] loadNibNamed:@"FPBottomCommentView" owner:nil options:nil].firstObject;
        _bottomCommentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 54, [UIScreen mainScreen].bounds.size.width, 54);
//        __weak typeof(self) weakSelf = self;
//        _bottomCommentView.tapCommentBlock = ^{
//            [FPCommentAccessoryView.share showText:nil placholder:@"输入评论" block:^(NSString * _Nonnull text) {
//                if (!text || text.length == 0) return ;
//                FPCommentModel *model = [weakSelf commentModel:text index:101 replay:NO];
//                [weakSelf.datas insertObject:model atIndex:0];
//                [weakSelf.adapter performUpdatesAnimated:NO completion:nil];
//
//            }];
//        };
    }
    return _bottomCommentView;
}
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 54, 0);
    }
    return _collectionView;
}
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:3];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"全部评论";
    self.datas = [NSMutableArray array];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.datas removeAllObjects];
    self.adapter.collectionView = self.collectionView;
}
//- (NSMutableArray*)loadDatas{
//    NSMutableArray *arr = [NSMutableArray array];
//    NSString *content = @"是我同学介绍我过去的是我同学介绍我过去的";
//    NSMutableArray *contents = [NSMutableArray array];
//    for (int i = 0 ; i < 10; i ++) {
//        {
//            [contents addObject:content];
//            [arr addObject:[self commentModel:[contents componentsJoinedByString:@"--"] index:i replay:YES]];
//        }
//    }
//    return arr;
//}
/*
- (FPCommentModel *)commentModel:(NSString *)text index:(NSInteger)i replay:(BOOL)replay{
    FPCommentModel *model = [FPCommentModel new];
    model.commentId = @(self.index).stringValue;
    model.userName = @"黛玉";
    model.userId = @(self.index).stringValue;
    model.time = @"8月4日";
    if (i % 2 == 0) {
        model.pictures = @[@"share_yqxz",@"share_yqxz",@"tup-csg",@"share_yqxz",@"tup-csg"];
    }
    model.content = text;
    NSMutableArray *replays = [NSMutableArray array];
    if (replay) {
        for (int j = 0; j < i * 2; j ++) {
            FPCommentReplayModel *model = [FPCommentReplayModel new];
            model.commentId = @(j).stringValue;
            model.commentText = @"我同学介绍我过去kdkdkdkdk的。我kdkddkkddkdddkk们家兽兽从来kdkdkdkdk都没有寄养过，这次是没有办法";
            model.commentUserName = @"回复人";
            model.commentUserId = @(j).stringValue;
            model.commentByUserId = @(j * 2).stringValue;
            model.commentByUserName = @"回复对象";
            [replays addObject:model];
        }
        model.comments = replays;
    }
    
    return model;
}
 */
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    
    return [UIView new];
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    FPCommentSectionController *SC = [FPCommentSectionController new];
    SC.delegate = self;
    return SC;
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.datas;
}
- (void)dealloc{
    NSLog(@"dealloc");
}
/*
- (void)userInfoEvent:(id<FPLinkProtocal>)link model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController *)sectionController{
    
}
- (void)replayCommentEvent:(id<FPCommentReplayProtocal>)replayModel model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController *)sectionController{
    if ([model.comments indexOfObject:replayModel] == 0) {
        [model.comments removeObject:replayModel];
        model.comments = model.comments;
        [self.adapter reloadObjects:@[model]];

    }else{
        [FPCommentAccessoryView.share showText:nil placholder:[NSString stringWithFormat:@"回复：%@",replayModel.commentUserName] block:^(NSString * _Nonnull text) {
            if (!text || text.length == 0) return ;
            NSMutableArray *arr = [NSMutableArray array];
            [arr addObjectsFromArray:model.comments];
            [arr addObject:[self infoModelmodel:text]];
            model.comments = arr;
            [self.adapter reloadObjects:@[model]];
        }];
    }
}
- (void)writeCommentEvent:(FPCommentModel*)model sectionController:(IGListSectionController*)sectionController{
    self.index += 1;
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObjectsFromArray:model.comments];
    __weak typeof(self) weakSelf = self;
    [FPCommentAccessoryView.share showText:nil placholder:[NSString stringWithFormat:@"回复：%@",model.userName] block:^(NSString * _Nonnull text) {
        if (!text || text.length == 0) return ;
        [arr addObject:[weakSelf infoModelmodel:text]];
        model.comments = arr;
        [weakSelf.adapter reloadObjects:@[model]];
    } ];
}
- (FPCommentReplayModel*)infoModelmodel:(NSString*)text{
    FPCommentReplayModel *model = [FPCommentReplayModel new];
    model.commentId = @(self.index).stringValue;
    model.commentUserName = @"回复人";
    model.commentText = text;
    model.commentUserId = @(self.index).stringValue;
    model.commentByUserId = @(self.index * 2).stringValue;
    model.commentByUserName = @"回复对象";
    return model;
}
- (void)replayCommentEvent:(id<FPLinkProtocal>)model sectionController:(IGListSectionController*)sectionController{
}
- (void)deleteCommentEvent:(id<FPCommentReplayProtocal>)model sectionController:(IGListSectionController*)sectionController{
    
}
- (void)browseImageEvent:(id)model fromCell:(UICollectionViewCell*)cell sectionController:(IGListSectionController*)sectionController{
}
 */
@end
