//
//  FPModuleProtocoal.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>


NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerConfigureProtocal <NSObject>
@property (nonatomic,strong)IGListSingleSectionCellConfigureBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPDequeueReusableCellProtocal <NSObject>
@property (nonatomic,strong)Class className;

@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionModelProtocal <IGListDiffable>
@required
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)CGFloat height;
@optional
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,assign)CGFloat width;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerProtocal <NSObject>
//必须实现一个
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,copy)IGListSectionController* (^sectionControllerBlock)(id<FPSectionModelProtocal> model);
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@protocol FPSubSectionModelsProtocal <NSObject>
@required
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@protocol FPListModuleProtocoal <FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>

@end
NS_ASSUME_NONNULL_END




