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
#import <FPCommentsModule/FPNestedSectionController.h>
#import <FPNestedSectionController.h>
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
#import "FPPreviewMoreCommentsModel.h"
#import "FPPreviewMoreCommentsCell.h"
#import "FPTestVC.h"
#import <FPNestedCollectionViewCell.h>
#import <SDWebImage/SDWebImage.h>
@interface FPViewController ()<IGListAdapterDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray <id<FPNestedSectionControllerProtocal>> *datas;
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
            FPListSectionController *sectonController = [FPListSectionController new];
            sectonController.configureCellBlock = ^(id  _Nonnull item, __kindof FPUserInfoCollectionCell * _Nonnull cell) {
                cell.imgView.backgroundColor = [UIColor orangeColor];
                
            };
            userModel.sectionController = sectonController;
            userModel.height = 60;
            userModel.userName = @"dkdkd";
            userModel.time = @"2019";
            userModel.nibName = @"FPUserInfoCollectionCell";
            userModel.bundle = [FPUserInfoCollectionCell userInfoCollectionCellBundle];
            [subArr addObject:userModel];
        }
        {
            FPTextModel *textModel = [FPTextModel new];
            textModel.class_name = FPTextCollectionCell.class;
            FPListSectionController *sectonController = [FPListSectionController new];
            textModel.font = [UIFont systemFontOfSize:13];
            sectonController.configureCellBlock = ^(FPTextModel*  _Nonnull item, __kindof FPTextCollectionCell * _Nonnull cell) {
                cell.label.text = item.content;
                cell.label.numberOfLines = item.numberOfLines;
                cell.label.font = item.font;
            };
            textModel.sectionController = sectonController;
            textModel.numberOfLines = 0;
            textModel.content = @"sectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionController";
            textModel.inset = UIEdgeInsetsMake(20, 100, 10, 50);
            textModel.width = kSWidth - textModel.inset.left - textModel.inset.right;
            [subArr addObject:textModel];
            
            
        }
        {
            FPVideoPictureModel *model = [FPVideoPictureModel new];
            FPVideoPictureSectionController *sectionController = [FPVideoPictureSectionController new];
            sectionController.loadNetworkImageBlock = ^(UIImageView * _Nonnull imageView, NSURL * _Nonnull url, UIImage * _Nonnull placeholderImage) {
                [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
            };
            model.sectionController = sectionController;
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            model.sources = [@[@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg",@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg"] mutableCopy];
            model.type = FPImageTypeShowImage;
            model.inset = UIEdgeInsetsMake(5, 68, 20, 20);
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
                FPCommentSubSectionController *sectionController = [FPCommentSubSectionController new];
                sectionController.tapLinkBlock = ^(FPCommentSubSectionController * _Nonnull sectionController, id<FPHyperlinkProtocal>  _Nonnull link) {
                    FPTestVC *vc = [FPTestVC new];
                    [self.navigationController pushViewController:vc animated:YES];
                };
                model.sectionController = sectionController;
                model.commentText = @"随着项目的不断迭代，各个模块会越来越复杂，各个模块相互依赖，而且每个模块可能会有共同的业务逻辑，导致整个项目维护起来比较麻烦。";
                model.commentByUserName = @"评论人";
                model.commentUserName = @"回复人";
                model.commentByUserId = @"444";
                model.commentUserId = @"333";
                model.commentId = @"9333993";
                model.width = width;
                if (i == 0) {
                    model.inset = UIEdgeInsetsMake(10, 12, 0, 12);
                }else if (i == 5){
                    model.inset = UIEdgeInsetsMake(0, 12, 10, 12);
                }
                model.sectionController.inset = model.inset;
                [arr addObject:model];
            }
            {
                FPPreviewMoreCommentsModel *model = [FPPreviewMoreCommentsModel new];
                model.sectionController = [FPListSectionController new];
                model.bundle = [NSBundle mainBundle];
                model.nibName = @"FPPreviewMoreCommentsCell";
                model.inset = UIEdgeInsetsMake(0, 12, 5, 0);
                [arr addObject:model];
                
            }
            commentModel.subSectionModels = arr;
            
            
            FPNestedSectionController *sc = [FPNestedSectionController new];
            sc.configureCellBlock = ^(id  _Nonnull item, __kindof UICollectionViewCell * _Nonnull cell) {
                cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
            };
            commentModel.sectionController = sc;
            [subArr addObject:commentModel];
        }
        {
            FPTextModel *textModel = [FPTextModel new];
            textModel.class_name = FPTextCollectionCell.class;
            FPListSectionController *sectonController = [FPListSectionController new];
            textModel.font = [UIFont systemFontOfSize:15];
            sectonController.configureCellBlock = ^(FPTextModel*  _Nonnull item, __kindof FPTextCollectionCell * _Nonnull cell) {
                cell.label.text = item.content;
                cell.label.numberOfLines = item.numberOfLines;
                cell.label.font = item.font;
            };
            textModel.sectionController = sectonController;
            textModel.numberOfLines = 0;
            textModel.content = @"sectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionControllersectionController";
            textModel.inset = UIEdgeInsetsMake(0, 50, 0, 50);
            textModel.width = kSWidth - textModel.inset.left - textModel.inset.right;

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
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            model.sources = [@[@"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg"] mutableCopy];
            FPVideoPictureSectionController *sectionController = [FPVideoPictureSectionController new];
            sectionController.loadNetworkImageBlock = ^(UIImageView * _Nonnull imageView, NSURL * _Nonnull url, UIImage * _Nonnull placeholderImage) {
                [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
            };
            model.sectionController = sectionController;

            model.type = FPImageTypeShowImage;
            model.maxImageCount = 1;
            model.oneItemSize = CGSizeMake(200, 300);
            model.inset = UIEdgeInsetsMake(20, 68, 20, 20);
            CGFloat width = kSWidth - 68 - 20;
            model.width = width;
            [subArr addObject:model];
        }
        {
            FPVideoPictureModel *model = [FPVideoPictureModel new];
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            model.type = FPImageTypeShowVideo;
            model.maxVideoCount = 1;
            model.inset = UIEdgeInsetsMake(20, 68, 20, 20);
            CGFloat width = kSWidth - 68 - 20;
            model.width = width;
            FPVideoItem *item = [FPVideoItem new];
            item.coverUrl =  @"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg";
            NSURL*url=  [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"mp4"]];
            item.videoUrl = url;
            FPVideoPictureSectionController *sectionController = [FPVideoPictureSectionController new];
            sectionController.loadNetworkImageBlock = ^(UIImageView * _Nonnull imageView, NSURL * _Nonnull url, UIImage * _Nonnull placeholderImage) {
                [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
            };
            model.sectionController = sectionController;
            item.itemSize = CGSizeMake(300, 300);
            model.oneItemSize = item.itemSize;
            model.sources = [@[item] mutableCopy];
            [subArr addObject:model];
        }
        
        
        
        FPMainModel *mainModel = [FPMainModel new];
        mainModel.subSectionModels = subArr;
        //        mainModel.sectionController = [FPMainSectionController new];
        mainModel.sectionControllerBlock = ^IGListSectionController * _Nonnull(id<FPSectionModelProtocal> _Nonnull model) {
            return [FPNestedSectionController new];
        };
        [datas addObject:mainModel];
    }
    
    self.datas = datas;
    self.adapter.collectionView = self.collectionView;
    
}
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.datas;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id<FPNestedSectionControllerProtocal>)object{
    if ([object respondsToSelector:@selector(sectionController)] && object.sectionController) {
        return object.sectionController;
    }else{
        return object.sectionControllerBlock(object);
    }
}
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    
    return nil;
}
@end
