//
//  FPCommentSubSectionController.h
//  FPCommentsModule
//
//  Created by fanpeng on 2020/1/6.
//

#import <IGListKit/IGListKit.h>

@protocol FPHyperlinkProtocal;
NS_ASSUME_NONNULL_BEGIN

@interface FPCommentSubSectionController : IGListSectionController
@property (nonatomic,copy)void (^tapLinkBlock)(FPCommentSubSectionController *sectionController,id<FPHyperlinkProtocal>  _Nonnull link);
@end

NS_ASSUME_NONNULL_END
