//
//  FPModuleProtocoal.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>


NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerProtocal <NSObject>
@required
@property (nonatomic,strong)IGListSectionController *sectionController;
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
@protocol FPSubSectionModels <NSObject>
@required
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@protocol FPListModuleProtocoal <FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModels>

@end
NS_ASSUME_NONNULL_END



