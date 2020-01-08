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
@property (nonatomic,assign)UIEdgeInsets sectionInset;
@property (nonatomic,assign)FPImageType type;
@property (nonatomic,strong)IGListSectionController *sectionController;

@end

NS_ASSUME_NONNULL_END
