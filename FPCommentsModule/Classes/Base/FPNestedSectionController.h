//
//  FPNestedSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"

NS_ASSUME_NONNULL_BEGIN
@interface FPBaseSectionController : IGListSectionController
<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPConfigureSectionCellBlock configureCellBlock;
@property (nonatomic,strong)FPConfigureSupplementaryViewBlock configureSupplementaryViewBlock;
@property (nonatomic,copy)void (^didSelectItemBlock)(IGListSectionController *sectionController,id<FPSectionModelProtocal,FPSectionControllerProtocal> model,NSInteger index);
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPNestedSectionController : FPBaseSectionController
<FPSectionControllerConfigureProtocal>
@property (nonatomic,readonly)IGListAdapter *adapter;
@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPListSectionController : FPBaseSectionController<FPSectionControllerConfigureProtocal>
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPNumberOfItemsSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPConfigureSectionCellBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END
