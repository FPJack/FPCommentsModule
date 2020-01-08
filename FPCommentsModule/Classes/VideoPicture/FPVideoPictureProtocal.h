//
//  FPVideoPictureProtocal.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/8.
//

#import <Foundation/Foundation.h>
#import "FPModuleProtocoal.h"
#import <FPImageVideoCell/FPImageVideoCell.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FPVideoPictureProtocal <FPSectionModelProtocal,FPSectionControllerProtocal>
@property (nonatomic,strong)NSMutableArray *sources;
@property (nonatomic,assign)CGSize oneItemSize;
@property (nonatomic,assign)NSInteger column;
@property (nonatomic,assign)CGFloat minimumLineSpacing;
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)UIEdgeInsets sectionInset;
@property (nonatomic,assign)FPImageType type;
@end
NS_ASSUME_NONNULL_END
