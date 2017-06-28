//
//  RNRecordButton.h
//  RNRecordButton
//
//  Created by Dowin on 2017/6/27.
//  Copyright © 2017年 Dowin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+React.h"
@class RNRecordButton;

@protocol RNRecordDelegate <NSObject>

@optional
- (void)recordTouchDownAction:(RNRecordButton *)btn;
- (void)recordTouchUpOutsideAction:(RNRecordButton *)btn;
- (void)recordTouchUpInsideAction:(RNRecordButton *)btn;
- (void)recordTouchDragEnterAction:(RNRecordButton *)btn;
- (void)recordTouchDragInsideAction:(RNRecordButton *)btn;
- (void)recordTouchDragOutsideAction:(RNRecordButton *)btn;
- (void)recordTouchDragExitAction:(RNRecordButton *)btn;

@end


@interface RNRecordButton : UIButton

@property (assign, nonatomic) id<RNRecordDelegate> delegate;
@property (copy, nonatomic) RCTBubblingEventBlock onChange;
@property (copy, nonatomic) NSArray *textArr;
@property (copy, nonatomic) NSString *fontSize;
- (void)setButtonStateWithRecording;
- (void)setButtonStateWithNormal;
- (void)setButtonStateWithCancel;

@end
