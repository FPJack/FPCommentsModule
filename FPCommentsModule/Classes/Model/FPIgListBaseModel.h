//
//  FPIgListBaseModel.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/4.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListKit.h>
#import "FPModuleProtocoal.h"
#import "FPCommentSubProtocal.h"

NS_ASSUME_NONNULL_BEGIN
@interface FPIgListBaseModel : NSObject<FPSectionModelProtocal>
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,assign)CGFloat width;
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@interface FPHyperlinkModel : NSObject<FPHyperlinkProtocal>
@property(nonatomic,assign)NSRange range;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,assign)BOOL enableTap;
@property(nonatomic,strong)NSDictionary* configure;
@end
NS_ASSUME_NONNULL_END



