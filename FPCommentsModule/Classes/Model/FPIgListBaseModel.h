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
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,assign)CGFloat width;


@end

NS_ASSUME_NONNULL_END
