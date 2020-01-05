//
//  FPCommentSubModel.h
//  FPCommentsModule_Example
//
//  Created by fanpeng on 2020/1/4.
//  Copyright © 2020 FPJack. All rights reserved.
//

#import <FPCommentsModule/FPIgListBaseModel.h>
#import <FPCommentSubProtocal.h>

NS_ASSUME_NONNULL_BEGIN

@interface FPCommentSubModel : FPIgListBaseModel<FPSectionControllerProtocal,FPCommentSubProtocal>
@property (nonatomic,strong)IGListSectionController *sectionController;
@property(nonatomic,copy)NSString *parentId;
@property(nonatomic,copy)NSString *commentId;
@property(nonatomic,copy)NSString *commentUserId;
@property(nonatomic,copy)NSString *commentUserName;
@property(nonatomic,copy)NSString *commentByUserId;
@property(nonatomic,copy)NSString *commentByUserName;
@property(nonatomic,copy)NSString *commentText;
@property (nonatomic,strong)NSAttributedString *attrText;
@property (nonatomic,strong)NSArray <id<FPHyperlinkProtocal>> *links;
@end

NS_ASSUME_NONNULL_END
