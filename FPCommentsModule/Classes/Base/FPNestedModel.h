//
//  FPIgListBaseModel.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"



NS_ASSUME_NONNULL_BEGIN
@interface FPIgListBaseModel : NSObject<FPSectionModelProtocal>
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)UIEdgeInsets sectionInset;
@property (nonatomic,assign)CGFloat width;

@property (nonatomic,strong)id<FPConfigureReusableViewProtocal> header;
@property (nonatomic,strong)id<FPConfigureReusableViewProtocal> footer;

@property (nonatomic,strong)id strongObject;//备用
@property (nonatomic,weak)id weakObject;//备用
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPModuleBaseModel : FPIgListBaseModel<FPSectionControllerProtocal,FPLoadReusableViewProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,copy)IGListSectionController* (^sectionControllerBlock)(id<FPSectionModelProtocal> model);

@property (nonatomic,strong)Class class_name;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPDequeueReusableModel : NSObject<FPConfigureReusableViewProtocal>
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)CGFloat width;
@property (nonatomic,strong)Class class_name;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end
NS_ASSUME_NONNULL_END


NS_ASSUME_NONNULL_BEGIN
@interface FPNestedModel : FPIgListBaseModel<FPNestedSectionControllerProtocal>
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *nestedSectionModels;
@property (nonatomic,assign)UIEdgeInsets collectionViewContentInset;
@property (nonatomic,copy)void (^confiureSubSectionModelBlock)(id<FPSectionModelProtocal,FPSectionControllerProtocal> subSectionModel);


@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,copy)IGListSectionController* (^sectionControllerBlock)(id<FPSectionModelProtocal> model);
@end
NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN
@interface FPUserModel : FPModuleBaseModel
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *rightBtnImageName;
@property(nonatomic,copy)NSString *headUrl;
@property(nonatomic,strong)UIImage *placeholderImage;
@property(nonatomic,copy)NSString *userName;
@end
NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN
@interface FPTextModel : FPModuleBaseModel
@property(nonatomic,copy)NSString *content;
@property (nonatomic,assign)int numberOfLines;
@property (nonatomic,strong)UIFont *font;
@end
NS_ASSUME_NONNULL_END



NS_ASSUME_NONNULL_BEGIN
@interface FPNumberItemModel : NSObject<FPNumberOfItemsModelProtocal>
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)CGSize size;
@property (nonatomic,strong)NSArray<id<FPWidthHeightProtocal,FPLoadReusableViewProtocal>> *itemModels;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,strong)Class class_name;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;

@property (nonatomic,strong)IGListSectionController *sectionController;
@end
NS_ASSUME_NONNULL_END
