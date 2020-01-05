//
//  IGListBaseModel.h
//  test
//
//  Created by fanpeng on 2019/11/15.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface IGListBaseModel : NSObject<IGListDiffable>
@property(nonatomic,copy)NSString *diffId;
@property (nonatomic,assign)UIEdgeInsets inset;
@property (nonatomic,assign)CGSize size;

@end

NS_ASSUME_NONNULL_END
