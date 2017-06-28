//
//  RecordView.m
//  RNRecordButton
//
//  Created by Dowin on 2017/6/27.
//  Copyright © 2017年 Dowin. All rights reserved.
//


#import "RecordView.h"
#import "RNRecordButton.h"

@interface RecordView()<RNRecordDelegate>{
    RNRecordButton *recordBtn;
}

@end

@implementation RecordView

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)
RCT_EXPORT_VIEW_PROPERTY(textArr, NSArray);
RCT_EXPORT_VIEW_PROPERTY(fontSize, NSString);

RCT_EXPORT_METHOD(setButtonStateWithNormal){
    [recordBtn setButtonStateWithNormal];//恢复未点击状态
}

- (UIView *)view{
    //实际组件的具体大小由js控制
    recordBtn = [[RNRecordButton alloc]init];
    recordBtn.delegate = self;
    return recordBtn;
}

#pragma mark -- RNRecordButtonDelegate

- (void)recordTouchDownAction:(RNRecordButton *)btn{
    NSLog(@"开始录音");
    if (!btn.selected) {
        btn.selected = YES;
        [btn setButtonStateWithRecording];
        if (!btn.onChange) {
            return;
        }
        btn.onChange(@{@"status":@"Start"});
    }
}
- (void)recordTouchUpOutsideAction:(RNRecordButton *)btn{
    NSLog(@"取消录音");
    [btn setButtonStateWithNormal];
    if (!btn.onChange) {
        return;
    }
    btn.onChange(@{@"status":@"Canceled"});
}
- (void)recordTouchUpInsideAction:(RNRecordButton *)btn{
    NSLog(@"完成录音");
    [btn setButtonStateWithNormal];
    if (!btn.onChange) {
        return;
    }
    btn.onChange(@{@"status":@"Complete"});
}
- (void)recordTouchDragInsideAction:(RNRecordButton *)btn{
    //持续调用
}
- (void)recordTouchDragOutsideAction:(RNRecordButton *)btn{
    //持续调用
}
//中间状态  从 TouchDragOutside ---> TouchDragInside
- (void)recordTouchDragEnterAction:(RNRecordButton *)btn{
    if (btn.selected) {
        NSLog(@"继续录音");
        [btn setButtonStateWithRecording];
        if (!btn.onChange) {
            return;
        }
        btn.onChange(@{@"status":@"Continue"});
    }
}
//中间状态  从 TouchDragInside ---> TouchDragOutside
- (void)recordTouchDragExitAction:(RNRecordButton *)btn{
    if (btn.selected) {
        NSLog(@"将要取消录音");
        [btn setButtonStateWithCancel];
        if (!btn.onChange) {
            return;
        }
        btn.onChange(@{@"status":@"Move"});
    }
}


@end
