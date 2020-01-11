//
//  FPTestVC.m
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/9.
//  Copyright © 2020 FPJack. All rights reserved.
//
#define kSWidth [UIScreen mainScreen].bounds.size.width

#import "FPTestVC.h"
#import <IGListKit/IGListKit.h>
#import <FPCommentsModule/FPModuleProtocoal.h>
#import <FPNestedSectionController.h>
#import <FPNestedModel.h>
@interface FPTestVC ()<IGListAdapterDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray <id<FPNumberOfItemsModelProtocal>> *datas;
@end
@implementation FPTestVC
- (IGListAdapter *)adapter{
    if (!_adapter) {
        _adapter = [[IGListAdapter alloc]initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
        _adapter.dataSource = self;
    }
    return _adapter;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.adapter.collectionView = self.collectionView;
    NSMutableArray *datas = [NSMutableArray array];
    CGFloat space  = 10;
    for (int i = 0 ; i < 5; i++ ) {
        FPNumberItemModel *model = [FPNumberItemModel new];
        model.minimumLineSpacing = space;
        model.minimumInteritemSpacing = space;
        model.inset = UIEdgeInsetsMake(20, 0, 20, 0);
        CGFloat width = (kSWidth - 10 * 5)/6;
        model.size = CGSizeMake(width, width);
        model.class_name = UICollectionViewCell.class;
        NSMutableArray *items = [NSMutableArray array];
        for (int j = 0 ; j < 10 ; j ++ ) {
            FPNumberItemModel *subItem = [FPNumberItemModel new];
            subItem.nibName = @"FPPreviewMoreCommentsCell";
            subItem.bundle = [NSBundle mainBundle];
            [items addObject:subItem];
        }
        model.itemModels = items;
        [datas addObject:model];
    }
    self.datas = datas;
    [self.adapter performUpdatesAnimated:YES completion:nil];
    
}


- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.datas;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id<FPNestedSectionControllerProtocal>)object{
    return [FPNumberOfItemsSectionController new];
}
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    
    return nil;
}
@end
