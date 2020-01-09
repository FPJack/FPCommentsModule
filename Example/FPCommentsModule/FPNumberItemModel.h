//
//  FPNumberItemModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/9.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FPCommentsModule/FPModuleProtocoal.h>
#import <IGListKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface FPNumberItemModel : NSObject<FPNumberOfItemsModelProtocal>
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)CGSize size;
@property (nonatomic,strong)NSArray<id<FPItemSizeProtocal,FPDequeueReusableCellProtocal>> *itemModels;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,strong)Class class_name;
@property (nonatomic,copy)NSString* nibName;
@property (nonatomic,strong)NSBundle *bundle;
@end

NS_ASSUME_NONNULL_END
