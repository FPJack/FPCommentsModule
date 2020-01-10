//
//  FPUserModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//
#import <FPCommentsModule/FPIgListBaseModel.h>

#import "FPCommentProtocal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPUserModel : FPIgListBaseModel<FPSectionControllerProtocal,FPCommentUserInfoProtocal,FPDequeueReusableCellProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *headUrl;
@property(nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end

NS_ASSUME_NONNULL_END
