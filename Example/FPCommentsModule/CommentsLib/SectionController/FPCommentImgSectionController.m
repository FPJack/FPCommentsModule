//
//  FPCommentImgSectionController.m
//  test
//
//  Created by fanpeng on 2019/11/14.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "FPCommentImgSectionController.h"
#import "FPCommentModel.h"
#import "CollectionImageCell.h"
@interface FPCommentImgSectionController()
@property (nonatomic,strong)id<FPCommentPictureProtocal> model;
@property (nonatomic,strong)IGListAdapter *adapter;

@end
@implementation FPCommentImgSectionController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        self.inset = UIEdgeInsetsMake(5, 68, 5, 20);
    }
    return self;
}
- (NSInteger)numberOfItems {
    return self.model.pictures.count;
}
- (CGSize)sizeForItemAtIndex:(NSInteger)index{
    return CGSizeMake(self.model.itemWidth, self.model.itemHeight);
}
- (UICollectionViewCell *)cellForItemAtIndex:(NSInteger)index {
    CollectionImageCell *cell =  [self.collectionContext dequeueReusableCellWithNibName:@"CollectionImageCell" bundle:nil forSectionController:self atIndex:index];
    cell.imgView.image = [UIImage imageNamed:self.model.pictures[index]];
    return cell;
}
- (void)didUpdateToObject:(id<FPCommentPictureProtocal>)object{
    self.model = object;
}
- (nullable UIView *)emptyViewForListAdapter:(nonnull IGListAdapter *)listAdapter {
    return nil;
}
- (void)didSelectItemAtIndex:(NSInteger)index{
}
@end
