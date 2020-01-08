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
@property (nonatomic,assign)NSInteger column;
@property (nonatomic,assign)CGFloat minimumLineSpacing;
@property (nonatomic,assign)CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)CGSize oneItemSize;
@property (nonatomic,assign)NSInteger maxImageCount;//当只显示一张图片且自定义图片size的时候 需设置maxImageCount=1
@property (nonatomic,assign)NSInteger maxVideoCount; //当只显示一个视频且自定义视频size的时候 需设置maxVideoCount=1
@property (nonatomic,assign)FPImageType type;
@end
NS_ASSUME_NONNULL_END
