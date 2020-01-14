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
#import <FPCommentSubModel.h>
#import <FPCommentSubCell.h>
#import <FPCommentSubSectionController.h>
#import <FPVideoPictureSectionController.h>
#import "FPTestVC.h"
#import <FPNestedCollectionViewCell.h>
#import <SDWebImage/SDWebImage.h>
#import <FPModuleHelper.h>
#import <FPTextViewInputView.h>
#define kDefaultNumberOfLines 5
#define kMoreCommentDiffId @"kMoreCommentDiffId"
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
    for (int i = 0 ; i < 10; i ++) {
        [datas addObject:[self createModel:i]];
    }
    self.datas = datas;
    self.adapter.collectionView = self.collectionView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addNewComment)];
    
}
- (void)addNewComment{
    [self.datas insertObject:[self createModel:self.datas.count] atIndex:0];
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
- (id)createSubComment:(NSString*)text nestedModel:(id<FPNestedSectionControllerProtocal>)nestedModel{
    FPCommentSubModel *model = [FPCommentSubModel new];
    CGFloat width = kSWidth - 68 - 12 * 2 - 20;
    FPCommentSubSectionController *sectionController = [FPCommentSubSectionController new];
    __weak typeof(self) weakSelf = self;
    sectionController.tapLinkBlock = ^(FPCommentSubSectionController * _Nonnull sectionController,id<FPCommentSubProtocal> commentModel ,id<FPHyperlinkProtocal>  _Nonnull link) {
        //点击用户名
    };
    sectionController.didSelectItemBlock = ^(IGListSectionController *sectionController,id<FPCommentSubProtocal> commentModel,NSInteger index) {
        id<FPNestedSectionControllerProtocal> comment = (id<FPNestedSectionControllerProtocal>)[FPModuleHelper sectionModelWithDiffId:@"comment" fromNestedModel:nestedModel];
        
        //点击回复内容
        if (sectionController.section == 0) {
            //删除操作
            [FPModuleHelper removeSectionModelWithDiffId:commentModel.diffId fromNestedModel:comment];
            if (comment.subSectionModels.count == 0) {
                [FPModuleHelper removeSectionModelWithDiffId:comment.diffId fromNestedModel:nestedModel];
            }
            nestedModel.height = 0;
            
            [nestedModel.sectionController.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
                [batchContext reloadSectionController:nestedModel.sectionController];
            } completion:nil];
            return ;
        }
        [FPTextViewInputView.share showText:nil placholder:@"输入" block:^(NSString * _Nonnull text) {
            if (!text) return ;
            FPCommentSubModel *subModel = [weakSelf createSubComment:text nestedModel:nestedModel];
            if ([FPModuleHelper indexWithDiffid:kMoreCommentDiffId fromNestedModel:comment] != NSNotFound) {
                [FPModuleHelper addSectionModel:subModel beforSectionModelDiffId:kMoreCommentDiffId fromNestedModel:comment];
            }else{
                [FPModuleHelper addSectionModel:subModel fromNestedModel:comment];
            }
            nestedModel.height = 0;
            [nestedModel.sectionController.collectionContext performBatchAnimated:YES updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
                [batchContext reloadSectionController:nestedModel.sectionController];
            } completion:nil];
        }];
    };
    model.textFont = [UIFont systemFontOfSize:13];
    model.sectionController = sectionController;
    model.commentText = text;
    model.commentByUserName = [NSString stringWithFormat:@"评论人"];
    model.width = width;
    model.commentUserName = @"回复人";
    model.commentByUserId = @"444";
    model.commentUserId = @"333";
    model.commentId = @"9333993";
    return model;
}
- (id)createExpandSection:(FPNestedModel*)nestedModel{
    
    FPTextModel *model = [FPTextModel new];
    FPListSectionController *sectionController = [FPListSectionController new];
    sectionController.configureCellBlock = ^(FPTextModel*  _Nullable item, __kindof FPBtnCollectionCell * _Nullable cell, IGListSectionController * _Nullable sectionController) {
        [cell.button setTitle:item.strongObject ? @"收起" : @"全文" forState:UIControlStateNormal];
        cell.tapBlock = ^(UIButton * _Nonnull button) {
            //点击查看更多评论
            item.strongObject = item.strongObject ? nil : @"";
            [button setTitle:item.strongObject ? @"收起" : @"全文" forState:UIControlStateNormal];
            FPTextModel *contentModel = (FPTextModel*)[FPModuleHelper sectionModelWithDiffId:@"FPTextModel" fromNestedModel:nestedModel];
            contentModel.numberOfLines = item.strongObject ? 0 : kDefaultNumberOfLines;
            contentModel.height = 0;
            nestedModel.height = 0;
            [nestedModel.sectionController.collectionContext performBatchAnimated:NO updates:^(id<IGListBatchContext>  _Nonnull batchContext) {
                [batchContext reloadSectionController:nestedModel.sectionController];
            } completion:nil];
        };
        [cell.button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    };
    model.sectionController = sectionController;
    model.class_name = FPBtnCollectionCell.class;
    model.height = 15;
    model.sectionInset = UIEdgeInsetsMake(5, 68, 0, 0);
    return model;
    
}
- (id)createModel:(int)index{
    {
        NSMutableArray *subArr = [NSMutableArray array];
        FPNestedSectionController *nestedSC = [FPNestedSectionController new];
        FPNestedModel *mainModel = [FPNestedModel new];
        
        {
            FPDequeueReusableModel *reusableModel = [FPDequeueReusableModel new];
            reusableModel.class_name = [UICollectionReusableView class];
            reusableModel.height = 30;
            reusableModel.width = kSWidth;
            mainModel.header = reusableModel;
        }
        {
            FPDequeueReusableModel *reusableModel = [FPDequeueReusableModel new];
            reusableModel.class_name = [UICollectionReusableView class];
            reusableModel.height = 30;
            reusableModel.width = kSWidth;
            mainModel.footer = reusableModel;
        }

        {
            FPUserModel *userModel = [FPUserModel new];
            userModel.diffId = @"FPUserModel";
            userModel.userName = [NSString stringWithFormat:@"%d--Jack",index];
            userModel.time = @"2019-09-02";
            FPListSectionController *sectonController = [FPListSectionController new];
            sectonController.configureCellBlock = ^(FPUserModel*  _Nonnull item, __kindof FPUserInfoCollectionCell * _Nonnull cell,IGListSectionController *sectionController) {
                cell.imgView.backgroundColor = [UIColor orangeColor];
                cell.label1.text = item.userName;
                cell.label2.text = item.time;
                cell.imgView.layer.cornerRadius = 22.5;
                cell.imgView.layer.masksToBounds = YES;
                cell.rightButtonTapBlock = ^(UIButton * _Nonnull button) {
                    [self.datas removeObject:mainModel];
                    [self.adapter performUpdatesAnimated:YES completion:nil];
                };
            };
            userModel.sectionController = sectonController;
            userModel.height = 60;
            userModel.nibName = @"FPUserInfoCollectionCell";
            userModel.bundle = [FPUserInfoCollectionCell userInfoCollectionCellBundle];
            {
                        FPDequeueReusableModel *reusableModel = [FPDequeueReusableModel new];
                        reusableModel.class_name = [UICollectionReusableView class];
                        reusableModel.height = 30;
                        reusableModel.width = kSWidth;
                        userModel.footer = reusableModel;
            }

            [subArr addObject:userModel];
        }
        {
            FPTextModel *textModel = [FPTextModel new];
            textModel.diffId = @"FPTextModel";
            textModel.class_name = FPTextCollectionCell.class;
            FPListSectionController *sectonController = [FPListSectionController new];
            textModel.font = [UIFont systemFontOfSize:13];
            sectonController.configureCellBlock = ^(FPTextModel*  _Nonnull item, __kindof FPTextCollectionCell * _Nonnull cell,IGListSectionController * sectionController) {
                cell.label.text = item.content;
                cell.label.numberOfLines = item.numberOfLines;
                cell.label.font = item.font;
                cell.label.textColor = [UIColor blackColor];
            };
            textModel.sectionController = sectonController;
            textModel.numberOfLines = 0;
            NSString *imageUrl = @"https://img.52z.com/upload/news/随着项目的不断迭代，各个模块会越来越复杂image/20180621/20180621055651_47663.jpg";
            int rand = arc4random() % 5 + 1;
            NSMutableArray *stringArr = [NSMutableArray array];
            for (int i = 0 ; i < rand; i ++) {
                [stringArr addObject:imageUrl];
            }
            textModel.numberOfLines = kDefaultNumberOfLines;
            NSString *content = [stringArr componentsJoinedByString:@"-"];
            textModel.content = content;
            textModel.sectionInset = UIEdgeInsetsMake(0, 68, 0, 50);
            textModel.width = kSWidth - textModel.sectionInset.left - textModel.sectionInset.right;
            [subArr addObject:textModel];
            
            if ([FPModuleHelper compareTextHeightWithNumberOfLines:textModel.numberOfLines font:textModel.font widht:textModel.width text:textModel.content]) {
                [subArr addObject:[self createExpandSection:mainModel]];
            }
        }
        
        
        {
            FPVideoPictureModel *model = [FPVideoPictureModel new];
            model.diffId = @"FPVideoPictureModel";
            FPVideoPictureSectionController *sectionController = [FPVideoPictureSectionController new];
            sectionController.configureCellBlock = ^(FPVideoPictureModel*  _Nonnull item, __kindof FPVideoPictureCollectionCell * _Nonnull cell,IGListSectionController *sectionController) {
                cell.imageVideoCell.cornerRadius = 5;
                cell.imageVideoCell.loadNetworkImageBlock = ^(UIImageView * _Nonnull imageView, NSURL * _Nonnull url, UIImage * _Nonnull placeholderImage) {
                    [imageView sd_setImageWithURL:url placeholderImage:placeholderImage];
                };
            };
            model.sectionController = sectionController;
            model.column = 3;
            model.minimumLineSpacing = 10;
            model.minimumInteritemSpacing = 10;
            NSString *imageUrl = @"https://img.52z.com/upload/news/image/20180621/20180621055651_47663.jpg";
            int rand = arc4random() % 10;
            if (rand < 7) {
                //图片
                int rand = arc4random() % 10 ;
                NSMutableArray *arr = [NSMutableArray array];
                for (int i = 0 ; i < rand; i ++) {
                    [arr addObject:[imageUrl mutableCopy]];
                }
                if (arr.count == 1) {
                    model.oneItemSize = CGSizeMake(arc4random()%100 + 100, arc4random()%100 + 100);
                    model.maxImageCount = 1;
                }
                model.sources = arr;
                model.type = FPImageTypeShowImage;
                if (rand == 4) {
                    model.sectionInset = UIEdgeInsetsMake(5, 68, 0, 100);
                    model.column = 2;
                    
                }else{
                    model.sectionInset = UIEdgeInsetsMake(5, 68, 0, 20);
                }
            }else{
                //视频
                FPVideoItem *item = [FPVideoItem new];
                item.coverUrl = imageUrl;
                item.itemSize = CGSizeMake(arc4random()%100 + 100, arc4random()%100 + 100);
                NSURL*url=  [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"example" ofType:@"mp4"]];
                item.videoUrl = url;
                model.maxVideoCount = 1;
                model.type = FPImageTypeShowVideo;
                model.oneItemSize = item.itemSize;
                model.sources = [@[item] mutableCopy];
                model.sectionInset = UIEdgeInsetsMake(5, 68, 0, 20);
                
            }
            model.width = kSWidth - model.sectionInset.left - model.sectionInset.right;
            if (model.sources.count > 0) {[subArr addObject:model];}
        }
        
        {
            FPTextModel *model = [FPTextModel new];
            FPListSectionController *sectionController = [FPListSectionController new];
            sectionController.configureCellBlock = ^(id  _Nonnull item, __kindof FPTextCollectionCell * _Nonnull cell,IGListSectionController * sectionController) {
                cell.label.text = @"两小时前";
                cell.label.font = [UIFont systemFontOfSize:12];
                cell.label.textColor = [UIColor grayColor];
            };
            model.sectionController = sectionController;
            model.class_name = FPTextCollectionCell.class;
            model.height = 30;
            model.sectionInset = UIEdgeInsetsMake(5, 68, 0, 0);
            {
                FPDequeueReusableModel *reusableModel = [FPDequeueReusableModel new];
                reusableModel.class_name = [UICollectionReusableView class];
                reusableModel.height = 30;
//                reusableModel.width = kSWidth - 68;
                model.header = reusableModel;
            }

            [subArr addObject:model];
        }
        
        {
            FPNestedModel *commentModel = [FPNestedModel new];
            commentModel.collectionViewContentInset = UIEdgeInsetsMake(10, 12, 10, 12);
            NSMutableArray *arr = [NSMutableArray array];
            NSInteger rand = arc4random() % 5 + 1;
            for (int i = 0; i < rand; i ++) {
                NSString *text = @"随着项目的不断迭代，各个模块会越来越复杂，各个模块相互依赖，而且每个模块可能会有共同比较麻烦。";
                NSMutableArray *jArr = [NSMutableArray array];
                NSInteger rand = arc4random() % 10 + 1;
                for (int j = 0 ; j < rand; j ++) {
                    [jArr addObject:text];
                }
                FPCommentSubModel *model = [self createSubComment:[jArr componentsJoinedByString:@"-"] nestedModel:mainModel];
                //                model.sectionController.inset = model.inset;
                [arr addObject:model];
            }
            if (rand > 5) {
                {
                    FPTextModel *model = [FPTextModel new];
                    FPListSectionController *sectionController = [FPListSectionController new];
                    sectionController.configureCellBlock = ^(id  _Nullable item, __kindof FPBtnCollectionCell * _Nullable cell, IGListSectionController * _Nullable sectionController) {
                        [cell.button setTitle:@"查看更多评论" forState:UIControlStateNormal];
                        cell.tapBlock = ^(UIButton * _Nonnull button) {
                            //点击查看更多评论
                            
                        };
                        [cell.button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                    };
                    model.diffId = kMoreCommentDiffId;
                    model.sectionController = sectionController;
                    model.class_name = FPBtnCollectionCell.class;
                    model.height = 15;
                    model.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0);
                    [arr addObject:model];
                }
            }
            commentModel.subSectionModels = arr;
            FPNestedSectionController *sc = [FPNestedSectionController new];
            sc.configureCellBlock = ^(id  _Nonnull item, __kindof FPNestedCollectionViewCell * _Nonnull cell,IGListSectionController *sectionController) {
                cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
                cell.contentView.layer.cornerRadius = 5;
                cell.contentView.layer.masksToBounds = YES;
            };
            commentModel.sectionInset = UIEdgeInsetsMake(0, 68, 0, 20);
            commentModel.sectionController = sc;
            commentModel.diffId = @"comment";
            [subArr addObject:commentModel];
        }
        
        mainModel.subSectionModels = subArr;
        mainModel.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
        mainModel.sectionController = nestedSC;
        return mainModel;
    }
    
    
}
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.datas;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id<FPNestedSectionControllerProtocal>)object{
    object.confiureSubSectionModelBlock = ^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull subSectionModel) {
        
    };
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
