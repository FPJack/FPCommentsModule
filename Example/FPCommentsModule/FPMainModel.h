//
//  FPMainModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <FPCommentsModule/FPIgListBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPMainModel : FPIgListBaseModel<FPListModuleProtocoal>
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@property (nonatomic,strong)IGListSectionController *sectionController;
@end

NS_ASSUME_NONNULL_END
