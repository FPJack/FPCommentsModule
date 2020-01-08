//
//  FPViewController.m
//  FPCommentsModule
//
//  Created by FPJack on 01/04/2020.
//  Copyright (c) 2020 FPJack. All rights reserved.
//
#define kSWidth [UIScreen mainScreen].bounds.size.width

#import "FPViewController.h"
#import <IGListKit/IGListKit.h>
#import <FPCommentsModule/FPMainSectionController.h>
#import <FPMainSectionController.h>
#import <FPCommentsModule/FPModuleProtocoal.h>
#import "FPMainModel.h"
#import "FPUserModel.h"
#import "FPCommentUserInfSectionController.h"
#import "FPTextModel.h"
#import "FPCommentContentSectionController.h"
#import "FPCommentBigModel.h"
#import "FPCommentSubModel.h"
#import "FPCommentReplayContainerController.h"
#import <FPCommentSubCell.h>
#import <FPCommentSubSectionController.h>
#import "FPVideoPictureModel.h"
#import <FPVideoPictureSectionController.h>
@interface FPViewController ()<IGListAdapterDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray <id<FPListModuleProtocoal>> *datas;
@end

@implementation FPViewController
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
        _adapter.dataSource = self;
    }
    return _adapter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    NSMutableArray *datas = [NSMutableArray array];
    {
        NSMutableArray *subArr = [NSMutableArray array];
        {
            FPUserModel *userModel = [FPUserModel new];
            userModel.sectionController = [FPCommentUserInfSectionController new];
            userModel.height = 50;
            userModel.userName = @"dkdkd";
            userModel.time = @"2019";
            [subArr addObject:userModel];
        }
        {
            FPTextModel *textModel = [FPTextModel new];
            textModel.sectionController = [FPCommentContentSectionController new];
            textModel.numberOfLines = 0;
            textModel.content = @"44444FPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionController";
            [subArr addObject:textModel];
        }
        {
            FPVideoPictureModel *model = [FPVideoPictureModel new];
            model.sectionController = [FPVideoPictureSectionController new];
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            model.sources = [@[@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg"] mutableCopy];
            model.type = FPImageTypeShowImage;
            model.inset = UIEdgeInsetsMake(20, 68, 20, 20);
            CGFloat width = kSWidth - 68 - 20;
            model.width = width;
            [subArr addObject:model];
        }

        {
            FPCommentBigModel *commentModel = [FPCommentBigModel new];
            
            NSMutableArray *arr = [NSMutableArray array];
            CGFloat width = kSWidth - 68 - 12 * 2 - 20;
            for (int i = 0; i < 5; i ++) {
                FPCommentSubModel *model = [FPCommentSubModel new];
                model.sectionController = [FPCommentSubSectionController new];
                model.commentText = @"随着项目的不断迭代，各个模块会越来越复杂，各个模块相互依赖，而且每个模块可能会有共同的业务逻辑，导致整个项目维护起来比较麻烦。";
                model.commentByUserName = @"评论人";
                model.commentUserName = @"回复人";
                model.commentByUserId = @"444";
                model.commentUserId = @"333";
                model.commentId = @"9333993";
                model.width = width;
                if (i == 0) {
                    model.inset = UIEdgeInsetsMake(10, 12, 0, 12);
                }else if (i == 49){
                    model.inset = UIEdgeInsetsMake(0, 12, 10, 12);
                }
                model.sectionController.inset = model.inset;
                [arr addObject:model];
                commentModel.subSectionModels = arr;
            }
            
            FPMainSectionController *sc = [FPMainSectionController new];
            sc.configureCellBlock = ^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
                cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            };
            
            commentModel.sectionController = sc;
            [subArr addObject:commentModel];
        }
        {
            FPTextModel *textModel = [FPTextModel new];
            textModel.sectionController = [FPCommentContentSectionController new];
            textModel.numberOfLines = 0;
            textModel.content = @"44444FPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentContentSectionControllerFPCommentctionControllerFPCommentContentSectionControllerFPCommentContentSectionController";
            [subArr addObject:textModel];
        }
        {
            FPUserModel *userModel = [FPUserModel new];
            userModel.sectionController = [FPCommentUserInfSectionController new];
            userModel.height = 50;
            userModel.userName = @"dkdkd";
            userModel.time = @"2019";
            [subArr addObject:userModel];
        }
        {
            FPVideoPictureModel *model = [FPVideoPictureModel new];
            model.sectionController = [FPVideoPictureSectionController new];
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            model.sources = [@[@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg"] mutableCopy];
            model.type = FPImageTypeShowImage;
            model.oneItemSize = CGSizeMake(100, 150);
            model.inset = UIEdgeInsetsMake(20, 68, 20, 20);
            CGFloat width = kSWidth - 68 - 20;
            model.width = width;
            [subArr addObject:model];
        }

        
        FPMainModel *mainModel = [FPMainModel new];
        mainModel.subSectionModels = subArr;
        mainModel.sectionController = [FPMainSectionController new];
        
        [datas addObject:mainModel];
    }
    
    self.datas = datas;
    self.adapter.collectionView = self.collectionView;
}
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.datas;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id<FPListModuleProtocoal>)object{
    return object.sectionController;
}
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    
    return nil;
}
@end
