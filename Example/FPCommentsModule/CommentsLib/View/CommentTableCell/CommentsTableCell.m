//
//  CommentsTableCell.m
//  test
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "CommentsTableCell.h"
#import "FPCommentProtocal.h"
#import "FPCommentModel.h"
#import "FPCommentSectionController.h"
#import <FPTextViewInputView.h>
//#import "UIViewController+present.h"
@interface CommentsTableCell()<IGListAdapterDataSource,CommentEventDelegate>
@property (nonatomic,strong)IGListAdapter *adapter;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
@implementation CommentsTableCell
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:nil workingRangeSize:0];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return [UIView new];
}
- (nonnull IGListSectionController *)listAdapter:(nonnull IGListAdapter *)listAdapter sectionControllerForObject:(nonnull id)object {
    FPCommentSectionController *SC = [FPCommentSectionController new];
    SC.delegate = self;
    return SC;
}
- (nonnull NSArray<id<IGListDiffable>> *)objectsForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return self.comment ? @[self.comment] : nil;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.adapter.collectionView = self.collectionView;
}
- (void)expendEvent:(id<FPCommentExpandProtocal>)model sectionController:(IGListSectionController*)sectionController{
    [self refreshTableViewHeight];
}
- (void)refreshTableViewHeight{
    UITableView *tableView = (UITableView*)self.superview;
    [tableView beginUpdates];
    [tableView endUpdates];
}
- (void)dealloc
{
    NSLog(@"CommentsTableCell--dealloc");
}
- (void)setComment:(id<FPCommentProtocal>)comment{
    _comment = comment;
    [self.adapter reloadDataWithCompletion:nil];
}
- (void)replayCommentEvent:(id<FPCommentReplayProtocal>)replayModel model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController *)sectionController{

    __weak typeof(self) weakSelf = self;
    [FPTextViewInputView.share showText:nil placholder:[NSString stringWithFormat:@"回复：%@",replayModel.commentUserName] block:^(NSString * _Nonnull text) {
        if (!text || text.length == 0) return ;
        NSString *userId = @"userId";
        NSDictionary *dic = @{@"businessId":weakSelf.businessId,
                              @"content":text,
                              @"userId":userId,
                              @"parentId":replayModel.commentId,
                              @"businessType":weakSelf.businessType
        };
        
//        [CommentModel replayCommentParmars:dic successBlock:^(CommentReplayModel * _Nonnull rModel) {
//            [NSObject dismissHUD];
//            rModel.commentByUserId = replayModel.commentUserId;
//            rModel.commentByUserName = replayModel.commentUserName;
//            NSMutableArray *arr = [NSMutableArray array];
//            [arr addObjectsFromArray:model.comments];
//            [arr addObject:rModel];
//            model.comments = arr;
//            [weakSelf.adapter reloadObjects:@[model]];
//            [weakSelf refreshTableViewHeight];
//        } failureBlock:^(NSError * _Nonnull error) {
//            [NSObject showStatus:error.description];
//        }];

    } ];
}
- (void)writeCommentEvent:(FPCommentModel*)model sectionController:(IGListSectionController*)sectionController{

    __weak typeof(self) weakSelf = self;
    [FPTextViewInputView.share showText:nil placholder:[NSString stringWithFormat:@"回复：%@",model.userName] block:^(NSString * _Nonnull text) {
        if (!text || text.length == 0) return ;
        NSString *userId = @"userid";
        NSDictionary *dic = @{@"businessId":weakSelf.businessId,
                              @"content":text,
                              @"userId":userId,
                              @"parentId":model.commentId,
                              @"businessType":weakSelf.businessType
        };
//        [NSObject showHUD];
//        [CommentModel replayCommentParmars:dic successBlock:^(CommentReplayModel * _Nonnull rModel) {
//            [NSObject dismissHUD];
//            NSMutableArray *arr = [NSMutableArray array];
//            [arr addObjectsFromArray:model.comments];
//            [arr addObject:rModel];
//            model.comments = arr;
//            [weakSelf.adapter reloadObjects:@[model]];
//            [weakSelf refreshTableViewHeight];
//        } failureBlock:^(NSError * _Nonnull error) {
//            [NSObject showStatus:error.description];
//        }];
    } ];
}
@end
