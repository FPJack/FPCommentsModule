//
//  FPModuleProtocoal.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>
typedef void (^FPListSingleSectionCellConfigureBlock)(id __nullable item, __kindof UICollectionViewCell * __nullable cell,IGListSectionController * __nullable sectionController);





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
#warning 必须实现一个

//建议初始化的时候直接赋值 后续通过模型可以直接拿该对象
@property (nonatomic,strong)IGListSectionController *sectionController;

//懒加载初始化没有做属性保存 没掉用一次生成一个新的sectionController对象 后续通过模型拿不到同一个对象
@property (nonatomic,copy)IGListSectionController* (^sectionControllerBlock)(id<FPSectionModelProtocal> model);
@end
NS_ASSUME_NONNULL_END

//配置cell
NS_ASSUME_NONNULL_BEGIN
@protocol FPSectionControllerConfigureProtocal <NSObject>
@optional
@property (nonatomic,strong)FPListSingleSectionCellConfigureBlock configureCellBlock;
@property (nonatomic,copy)void (^didSelectItemBlock)(IGListSectionController *sectionController,id<FPSectionModelProtocal,FPSectionControllerProtocal> model,NSInteger index);
@end
NS_ASSUME_NONNULL_END


//子SectionControllers
NS_ASSUME_NONNULL_BEGIN
@protocol FPSubSectionModelsProtocal <NSObject>
@required
@property (nonatomic,strong)NSMutableArray <id<FPSectionModelProtocal,FPSectionControllerProtocal>> *subSectionModels;
@property (nonatomic,assign)UIEdgeInsets collectionViewContentInset;
@property (nonatomic,copy)void (^confiureSubSectionModelBlock)(id<FPSectionModelProtocal,FPSectionControllerProtocal> subSectionModel);
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

