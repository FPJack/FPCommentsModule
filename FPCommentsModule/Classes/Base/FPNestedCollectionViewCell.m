//
//  FPNestedCollectionViewCell.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import "FPNestedCollectionViewCell.h"
@interface FPNestedCollectionViewCell()
@property (nonatomic, readwrite)UICollectionView *collectionView;
@end
@implementation FPNestedCollectionViewCell
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {[self setUI];}
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.collectionView];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:self.collectionView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.contentView addConstraints:@[constraint1,constraint2,constraint3,constraint4]];
}
@end



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

@implementation FPCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        {
        [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.label];
        NSLayoutConstraint *leftCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15];
        NSLayoutConstraint *centerYCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
        self.labelLeftCon = leftCon;
        [self addConstraints:@[leftCon,centerYCon]];
        }
        {
        [self.button setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.button];
        self.buttonRightCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15];
        NSLayoutConstraint* centerYCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
            [self addConstraints:@[self.buttonRightCon,centerYCon]];
        }
    }
    return self;
}
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
        _label.font = [UIFont systemFontOfSize:13];
    }
    return _label;
}
- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (void)buttonAction:(UIButton*)btn{if (self.buttonTapBlock) self.buttonTapBlock(btn);}
@end


@implementation FPBtnCollectionCell
- (UIButton *)button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont systemFontOfSize:13];
        [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
- (void)buttonAction:(UIButton*)btn{if (self.tapBlock) self.tapBlock(btn);}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {[self setUI];}
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.button];
    [self.button setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.leftCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    self.rightCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    self.topCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    self.bottomCon = [NSLayoutConstraint constraintWithItem:self.button attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.contentView addConstraints:@[self.leftCon,self.topCon,self.bottomCon,self.rightCon]];
}
@end




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





@implementation FPTextCollectionCell
- (UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
    }
    return _label;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}
- (void)setUI{
    [self.contentView addSubview:self.label];
    [self.label setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.leftCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    self.rightCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    self.topCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    self.bottomCon = [NSLayoutConstraint constraintWithItem:self.label attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.contentView addConstraints:@[self.leftCon,self.topCon,self.bottomCon,self.rightCon]];
}
@end


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


@implementation FPUserInfoCollectionCell
- (IBAction)rightButtonAction:(UIButton *)sender {
    if (self.rightButtonTapBlock) self.rightButtonTapBlock(sender);
}
+ (NSBundle*)userInfoCollectionCellBundle{
    static NSBundle *bundle;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle bundleForClass:[FPUserInfoCollectionCell class]];
        NSURL * url = [bundle URLForResource:@"FPCommentsModule" withExtension:@"bundle"];
        if (url) bundle =  [NSBundle bundleWithURL:url];
    });
    return bundle;
}
@end
