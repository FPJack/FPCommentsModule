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
#import <FPCommentsModule.h>
@interface FPTestVC ()<IGListAdapterDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)IGListAdapter *adapter;
@property (nonatomic,strong)NSMutableArray <id<FPNumberOfItemSectionModelProtocal>> *datas;
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
        model.sectionInset = UIEdgeInsetsMake(20, 0, 20, 0);
        CGFloat width = (kSWidth - 10 * 5)/6;
        model.width = width;
        model.height = width;
        NSMutableArray *items = [NSMutableArray array];
        for (int j = 0 ; j < 10 ; j ++ ) {
            FPDequeueReusableModel *subItem = [FPDequeueReusableModel new];
            subItem.nibName = @"FPPreviewMoreCommentsCell";
            subItem.bundle = [NSBundle mainBundle];
            [items addObject:subItem];
        }
        model.cellItems = items;
        [datas addObject:model];
    }
    self.datas = datas;
    [self.adapter performUpdatesAnimated:YES completion:nil];
}
- (NSArray<id <IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
    return self.datas;
}
- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id<FPNumberOfItemSectionModelProtocal>)object{
    return [FPNumberOfItemsSectionController new];
}
- (nullable UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
    
    return nil;
}
@end
