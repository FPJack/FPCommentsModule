//
//  FPListSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/5.
//

#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"

NS_ASSUME_NONNULL_BEGIN

@interface FPListSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)IGListSingleSectionCellConfigureBlock configureBlock;

@end

NS_ASSUME_NONNULL_END
