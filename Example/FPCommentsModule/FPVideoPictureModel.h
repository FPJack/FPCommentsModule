//
//  FPVideoPictureModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/8.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FPCommentsModule/FPIgListBaseModel.h>

#import <FPVideoPictureProtocal.h>
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
