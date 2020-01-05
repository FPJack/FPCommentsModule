//
//  CommentsTableCell.h
//  test
//
//  Created by fanpeng on 2019/11/18.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FPCommentProtocal.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommentsTableCell : UITableViewCell
//@property (nonatomic,strong)NSMutableArray<id<FPCommentProtocal>> *datas;
@property (nonatomic,strong)id<FPCommentProtocal> comment;
@property (nonatomic,copy)NSString *businessId;
@property (nonatomic,copy)NSString *businessType;
@end

NS_ASSUME_NONNULL_END
