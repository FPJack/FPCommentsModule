//
//  FPCommentContainerCell.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPCommentContainerCell.h"
#import <Masonry/Masonry.h>
@implementation FPCommentContainerCell
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor grayColor];
    }
    return _collectionView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.collectionView];
        __weak typeof(self) weakSelf = self;
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.mas_equalTo(weakSelf.contentView);
//            make.top.mas_equalTo(weakSelf.contentView).mas_offset(5);
//            make.bottom.mas_equalTo(weakSelf.contentView).mas_offset(-5);

            make.edges.equalTo(weakSelf.contentView);
        }];
    }
    return self;
}
@end
