//
//  FPViewController.m
//  FPCommentsModule
//
//  Created by FPJack on 01/04/2020.
//  Copyright (c) 2020 FPJack. All rights reserved.
//

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
#import <FPCommentContainerSectionController.h>
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
            FPCommentBigModel *commentModel = [FPCommentBigModel new];
            commentModel.sectionController = [FPCommentContainerSectionController new];
            [subArr addObject:commentModel];
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
