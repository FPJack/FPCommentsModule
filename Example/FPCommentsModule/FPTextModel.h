//
//  FPTextModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <FPCommentsModule/FPIgListBaseModel.h>
#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPTextModel : FPIgListBaseModel<FPSectionControllerProtocal,FPCommentContentProtocal,FPDequeueReusableCellProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property(nonatomic,copy)NSString *content;
@property (nonatomic,assign)int numberOfLines;
@property (nonatomic,strong)UIFont *font;
@property (nonatomic,strong)Class class_name;


@end

NS_ASSUME_NONNULL_END
