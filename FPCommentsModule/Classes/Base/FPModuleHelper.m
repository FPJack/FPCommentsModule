//
//  FPModuleHelper.m
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/9.
//
#import "FPModuleHelper.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>
@implementation FPModuleHelper

+ (NSInteger)indexWithSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    __block NSInteger index = NSNotFound;
    [nestedModel.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqual:sectionModel]) {
            index = idx;
        }
    }];
    return index;
}


+(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModelWithDiffId:(NSString*)diffId fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    __block id <FPSectionModelProtocal,FPSectionControllerProtocal> model;
    [nestedModel.subSectionModels enumerateObjectsUsingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.diffId isEqualToString:diffId]) {
            model = obj;
            *stop = YES;
        }
    }];
    return model;
}
+(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModelWithIndex:(NSInteger)index fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    if (index < 0 || !nestedModel ||!nestedModel.subSectionModels) {
        return nil;
    }
    if (index < nestedModel.subSectionModels.count) {
        return nestedModel.subSectionModels[index];
    }
    return nil;
}

+ (void)removeSectionModelWithDiffId:(NSString*)diffId fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    __weak typeof(nestedModel) weakNestedModel = nestedModel;
    [nestedModel.subSectionModels enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id<FPSectionModelProtocal,FPSectionControllerProtocal>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.diffId isEqualToString:diffId]) {
            nestedModel.height = 0;
            [weakNestedModel.subSectionModels removeObject:obj];
            *stop = YES;
        }
    }];
}
+ (void)removeSectionModelWithModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    [self removeSectionModelWithDiffId:sectionModel.diffId fromNestedModel:nestedModel];
}
+ (void)removeSectionModelWithIndex:(NSInteger)index fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    if (nestedModel.subSectionModels.count > index) {
        nestedModel.height = 0;
        [nestedModel.subSectionModels removeObjectAtIndex:index];
    }
}

+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    if (sectionModel && nestedModel && nestedModel.subSectionModels) {
        [nestedModel.subSectionModels addObject:sectionModel];
    }
}


+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel afterSectionModelDiffId:(NSString*)diffId  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    id<FPSectionModelProtocal,FPSectionControllerProtocal> afterSectionModel = [self sectionModelWithDiffId:diffId fromNestedModel:nestedModel];
    [self addSectionModel:sectionModel afterSectionModel:afterSectionModel fromNestedModel:nestedModel];
}
+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel afterSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)afterSectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    NSInteger afterIndex = [self indexWithSectionModel:afterSectionModel fromNestedModel:nestedModel];
    if (afterIndex != NSNotFound) {
        [nestedModel.subSectionModels insertObject:sectionModel atIndex:afterIndex + 1];
        nestedModel.height = 0;
    }
}

+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel beforSectionModelDiffId:(NSString*)diffId  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    id<FPSectionModelProtocal,FPSectionControllerProtocal> beforSectionModel = [self sectionModelWithDiffId:diffId fromNestedModel:nestedModel];
    [self addSectionModel:sectionModel beforSectionModel:beforSectionModel fromNestedModel:nestedModel];
}
+ (void)addSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)sectionModel beforSectionModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal>)beforSectionModel  fromNestedModel:(id<FPSectionModelProtocal,FPSectionControllerProtocal,FPSubSectionModelsProtocal>)nestedModel{
    NSInteger beforIndex = [self indexWithSectionModel:beforSectionModel fromNestedModel:nestedModel];
    if (beforIndex != NSNotFound) {
        [nestedModel.subSectionModels insertObject:sectionModel atIndex:beforIndex];
        nestedModel.height = 0;
    }
}









+ (CGFloat)configureTextHeight:(NSString*)text font:(UIFont*)font widht:(CGFloat)width{
    if (text == nil || text.length == 0) return 0;
    return [self configureTextHeightText:text font:font widht:width numberOfLines:0];
}
+ (CGFloat)configureTextHeightText:(NSString*)text font:(UIFont*)font widht:(CGFloat)width numberOfLines:(int)numberOfLines{
    if (font == nil || width == 0) return 0;
    static UILabel *label;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        label = [UILabel new];
    });
    label.font = font;
    label.text = text;
    label.numberOfLines = numberOfLines;
    return ceil([label sizeThatFits:CGSizeMake(width, MAXFLOAT)].height);
}
+ (CGFloat)configureTTTAttributedLabelTextHeightText:(NSString*)text configure:(NSDictionary*)config width:(CGFloat)width numberOfLines:(int)numberOfLines{
    static TTTAttributedLabel *label;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        label = [[TTTAttributedLabel alloc]initWithFrame:CGRectZero];
        label.numberOfLines = 0;
    });
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        [mutableAttributedString setAttributes:config range:NSMakeRange(0, mutableAttributedString.length)];
        return mutableAttributedString;
    }];
    label.numberOfLines = numberOfLines;
    return ceil([label sizeThatFits:CGSizeMake(width, MAXFLOAT)].height);
}
@end
