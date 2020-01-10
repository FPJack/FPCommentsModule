//
//  FPVideoPictureSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/8.
//

#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"
NS_ASSUME_NONNULL_BEGIN

@interface FPVideoPictureSectionController : IGListSectionController<FPSectionControllerConfigureProtocal>
@property (nonatomic,strong)IGListSingleSectionCellConfigureBlock configureCellBlock;
@property (nonatomic,copy)void (^loadNetworkImageBlock)(UIImageView *imageView,NSURL *url,UIImage* placeholderImage);
@end
NS_ASSUME_NONNULL_END
