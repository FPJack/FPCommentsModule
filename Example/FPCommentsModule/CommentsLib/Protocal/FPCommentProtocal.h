//
//  FPCommentProtocal.h
//  test
//
//  Created by fanpeng on 2019/11/13.
//  Copyright © 2019 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <IGListKit.h>

#import <TTTAttributedLabel.h>

#define kContentFont [UIFont systemFontOfSize:14]
#define kCommentFont [UIFont systemFontOfSize:13]

NS_ASSUME_NONNULL_BEGIN
@protocol FPLinkProtocal <NSObject>
@property(nonatomic,assign)NSRange range;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,assign)BOOL enableTap;
@property(nonatomic,strong)NSDictionary* configure;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentReplayProtocal <IGListDiffable>
@property(nonatomic,copy)NSString *parentId;
@property(nonatomic,copy)NSString *commentId;
@property(nonatomic,copy)NSString *commentUserId;
@property(nonatomic,copy)NSString *commentUserName;
@property(nonatomic,copy)NSString *commentByUserId;
@property(nonatomic,copy)NSString *commentByUserName;
@property(nonatomic,copy)NSString *commentText;

@property (nonatomic,strong)NSAttributedString *attrText;
@property (nonatomic,strong)NSArray <id<FPLinkProtocal>> *links;
@property (nonatomic,assign)CGFloat height;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentUserInfoProtocal <IGListDiffable>
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *headUrl;
@property(nonatomic,copy)NSString *userName;
@property (nonatomic,assign)CGFloat height;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentContentProtocal <IGListDiffable>
@property(nonatomic,copy)NSString *content;
@property (nonatomic,assign)CGFloat height;
@property (nonatomic,assign)int numberOfLines;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentExpandProtocal <IGListDiffable>
@property(nonatomic,assign)CGFloat height;
@property (nonatomic,assign)BOOL expand;
@property (nonatomic,copy)NSString* title;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentPictureProtocal <IGListDiffable>
@property (nonatomic,strong)NSArray *pictures;
@property (nonatomic,assign)int column;
@property (nonatomic,assign)int line;
@property (nonatomic,assign)CGFloat itemHeight;
@property (nonatomic,assign)CGFloat itemWidth;
@property (nonatomic,assign)CGFloat height;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentReplayContainerProtocal <IGListDiffable>
@property (nonatomic,strong)NSMutableArray<id <FPCommentReplayProtocal>> *comments;
@property (nonatomic,assign)CGFloat height;
@end
NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_BEGIN
@protocol FPCommentProtocal <IGListDiffable>
//！！！！！ 外部赋值属性
@property (nonatomic,strong,nullable)NSMutableArray<id <FPCommentReplayProtocal>> *comments;
@property (nonatomic,strong)NSArray *pictures;
@property(nonatomic,copy)NSString *commentId;
@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *headUrl;
@property(nonatomic,copy)NSString *userName;
@property (nonatomic,assign)int numberOfLines;
//！！！！！ 内部自动赋值属性，遵守该协议的模型重写该属性就可以了
@property (nonatomic,assign)BOOL showExpandRow;
@property (nonatomic,assign)CGFloat cellHeight;
@property (nonatomic,strong,readonly)id<FPCommentExpandProtocal> expandInfo;
@property (nonatomic,strong,readonly)id<FPCommentUserInfoProtocal> userInfo;
@property (nonatomic,strong,readonly)id<FPCommentContentProtocal> contentInfo;
@property (nonatomic,strong,readonly)id<FPCommentPictureProtocal> picturesInfo;
@property (nonatomic,strong,nullable)id<FPCommentReplayContainerProtocal> commentsInfo;
@end
NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN
@protocol CommentEventDelegate<NSObject>
@optional
- (void)expendEvent:(id<FPCommentExpandProtocal>)model sectionController:(IGListSectionController*)sectionController;
- (void)writeCommentEvent:(id<FPCommentProtocal>)model sectionController:(IGListSectionController*)sectionController;
- (void)userInfoEvent:(id<FPLinkProtocal>)link model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController*)sectionController;
- (void)replayCommentEvent:(id<FPCommentReplayProtocal>)replayModel model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController*)sectionController;
- (void)deleteCommentEvent:(id<FPCommentReplayProtocal>)replayModel model:(id<FPCommentProtocal>)model sectionController:(IGListSectionController*)sectionController;
- (void)browseImageEvent:(id)model fromCell:(UICollectionViewCell*)cell sectionController:(IGListSectionController*)sectionController;
@end
NS_ASSUME_NONNULL_END
