//
//  FPVideoPictureSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/8.
//

#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"
#import <FPImageVideoCell/FPImageVideoCell.h>
#import <FPCommentsModule/FPNestedModel.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FPVideoPictureProtocal <FPSectionModelProtocal,FPSectionControllerProtocal>
@property (nonatomic,strong)NSMutableArray *sources;
@property (nonatomic,assign)NSInteger column;
@property (nonatomic,assign)CGFloat minimumLineSpacing;
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)CGSize oneItemSize;
@property (nonatomic,assign)NSInteger maxImageCount;//当只显示一张图片且自定义图片size的时候 需设置maxImageCount=1
@property (nonatomic,assign)NSInteger maxVideoCount; //当只显示一个视频且自定义视频size的时候 需设置maxVideoCount=1
@property (nonatomic,assign)FPImageType type;
@end
NS_ASSUME_NONNULL_END




NS_ASSUME_NONNULL_BEGIN
@interface FPVideoPictureModel : FPIgListBaseModel<FPVideoPictureProtocal>
@property (nonatomic,strong)NSMutableArray *sources;
@property (nonatomic,assign)CGSize oneItemSize;
@property (nonatomic,assign)NSInteger column;
@property (nonatomic,assign)CGFloat minimumLineSpacing;
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)FPImageType type;
@property (nonatomic,assign)NSInteger maxImageCount;
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,assign)NSInteger maxVideoCount; //当只显示一个视频且自定义视频size的时候 需设置maxVideoCount=1
@end
NS_ASSUME_NONNULL_END






NS_ASSUME_NONNULL_BEGIN
@interface FPVideoPictureCollectionCell : UICollectionViewCell
@property (nonatomic,readonly)FPImageVideoCell *imageVideoCell;
@end
NS_ASSUME_NONNULL_END







NS_ASSUME_NONNULL_BEGIN
@interface FPVideoPictureSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPListSingleSectionCellConfigureBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END

