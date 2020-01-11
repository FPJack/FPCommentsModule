//
//  FPNestedSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"

NS_ASSUME_NONNULL_BEGIN

@interface FPNestedSectionController : IGListSectionController
<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPListSingleSectionCellConfigureBlock configureCellBlock;
@property (nonatomic,readonly)IGListAdapter *adapter;
@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPListSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPListSingleSectionCellConfigureBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPNumberOfItemsSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)FPListSingleSectionCellConfigureBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END
