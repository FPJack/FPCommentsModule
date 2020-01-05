//
//  FPMainCollectionCell.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import "FPMainCollectionCell.h"
#import <Masonry/Masonry.h>

@implementation FPMainCollectionCell
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.contentView addSubview:self.collectionView];
    __weak typeof(self) weakSelf = self;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.contentView);
    }];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.collectionView];
        __weak typeof(self) weakSelf = self;
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.contentView);
        }];
    }
    return self;
}
@end
