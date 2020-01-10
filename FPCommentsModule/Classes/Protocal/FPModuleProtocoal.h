//
//  FPModuleProtocoal.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>


//配置cell
NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerConfigureProtocal <NSObject>
@property (nonatomic,strong)IGListSingleSectionCellConfigureBlock configureCellBlock;
@end
NS_ASSUME_NONNULL_END



//DequeueCell
NS_ASSUME_NONNULL_BEGIN
@protocol FPDequeueReusableCellProtocal <NSObject>
@optional
@property (nonatomic,strong)Class class_name;

@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end
NS_ASSUME_NONNULL_END




//配置SectionController宽高 SectionInset
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



//SectionController生成器
NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerProtocal <NSObject>
@optional
//必须实现一个
@property (nonatomic,strong)IGListSectionController *sectionController;
@property (nonatomic,copy)IGListSectionController* (^sectionControllerBlock)(id<FPSectionModelProtocal> model);
@end
NS_ASSUME_NONNULL_END



//子SectionControllers
NS_ASSUME_NONNULL_BEGIN
@protocol FPSubSectionModelsProtocal <NSObject>
@required
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@end
NS_ASSUME_NONNULL_END



//嵌套SectionControllers 配合FPNestedSectionController使用
NS_ASSUME_NONNULL_BEGIN
@protocol FPNestedSectionControllerProtocal  <FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>
@end
NS_ASSUME_NONNULL_END



//每个itemSize
NS_ASSUME_NONNULL_BEGIN
@protocol FPItemSizeProtocal  <NSObject>
@property (nonatomic,assign)CGSize size;
@end
NS_ASSUME_NONNULL_END



//一组有多个item
NS_ASSUME_NONNULL_BEGIN
@protocol FPNumberOfItemsModelProtocal  <IGListDiffable,FPDequeueReusableCellProtocal,FPItemSizeProtocal>
//配合 FPNumberOfItemsSectionController使用
//sizeForItemAtIndex 优先调用itemModels里面每个item的size 如果每个item无size则调用self全局size
@required
@property (nonatomic,strong)NSArray<id<FPItemSizeProtocal,FPDequeueReusableCellProtocal>> *itemModels;
@optional
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@end
NS_ASSUME_NONNULL_END

