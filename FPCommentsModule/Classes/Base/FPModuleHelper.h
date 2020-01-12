//
//  FPModuleHelper.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//

#import <Foundation/Foundation.h>
#import "FPModuleProtocoal.h"
NS_ASSUME_NONNULL_BEGIN
@interface FPModuleHelper : NSObject


+ (NSInteger)indexWithSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+ (NSInteger)indexWithDiffid:(NSString*)diffId fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;


+(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModelWithDiffId:(NSString*)diffId fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModelWithIndex:(NSInteger)index fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;



+ (void)removeSectionModelWithDiffId:(NSString*)diffId fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+ (void)removeSectionModelWithIndex:(NSInteger)index fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+ (void)removeSectionModelWithModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;

+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;

+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel afterSectionModelDiffId:(NSString*)diffId  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel afterSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)afterSectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;

+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel beforSectionModelDiffId:(NSString*)diffId  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;
+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel beforSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)beforSectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel;








+ (CGFloat)configureTextHeight:(NSString*)text font:(UIFont*)font widht:(CGFloat)width;
+ (CGFloat)configureTextHeightText:(NSString*)text font:(UIFont*)font widht:(CGFloat)width numberOfLines:(int)numberOfLines;
+ (BOOL)compareTextHeightWithNumberOfLines:(int)numberOfLines font:(UIFont*)font widht:(CGFloat)width text:(NSString*)text;

@end
NS_ASSUME_NONNULL_END
