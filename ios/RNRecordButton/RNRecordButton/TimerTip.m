//
//  TimerTip.m
//  RNRecordButton
//
//  Created by Dowin on 2017/6/28.
//  Copyright © 2017年 Dowin. All rights reserved.
//

#import "TimerTip.h"
#import "RNRecordTipsView.h"

@implementation TimerTip

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(level, NSString)
RCT_EXPORT_VIEW_PROPERTY(status, NSString)
RCT_EXPORT_VIEW_PROPERTY(time, NSString);
RCT_EXPORT_VIEW_PROPERTY(numFontSize, NSString);

- (UIView *)view{
    //实际组件的具体大小由js控制
    RNRecordTipsView *recordTipView = [[RNRecordTipsView alloc]init];
    return recordTipView;
}



@end
