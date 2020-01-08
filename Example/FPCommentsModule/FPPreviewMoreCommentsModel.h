//
//  FPPreviewMoreCommentsModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/8.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FPCommentsModule/FPIgListBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPPreviewMoreCommentsModel : FPIgListBaseModel<FPDequeueReusableCellProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end

NS_ASSUME_NONNULL_END
