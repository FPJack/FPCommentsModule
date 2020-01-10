//
//  FPCommentBigModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <FPCommentsModule/FPIgListBaseModel.h>
#import <FPCommentSubProtocal.h>
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentBigModel : FPIgListBaseModel<FPNestedSectionControllerProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@end
NS_ASSUME_NONNULL_END
