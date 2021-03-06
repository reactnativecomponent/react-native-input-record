//
//  RNRecordTipsView.m
//  RNRecordButton
//
//  Created by Dowin on 2017/6/28.
//  Copyright © 2017年 Dowin. All rights reserved.
//

#import "RNRecordTipsView.h"

@interface RNRecordTipsView (){
    UILabel *tipLabel;
    UIImageView *leftImage;
    UIImageView *rightImage;
    UIImageView *statusImage;
    UILabel *tipsNumLabel;
}

@end

@implementation RNRecordTipsView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
//        self.layer.cornerRadius = 6.0f;
        [self addContent];
        
    }
    
    return self;
    
}

- (void)addContent{
    
    tipLabel = [[UILabel alloc] init];
    [self addSubview:tipLabel];
    tipLabel.font = [UIFont systemFontOfSize:14];
    tipLabel.textAlignment = NSTextAlignmentCenter;
    tipLabel.layer.cornerRadius = 4.0f;
    
    leftImage = [[UIImageView alloc] init];
    leftImage.hidden = YES;
    [self addSubview:leftImage];
    
    rightImage = [[UIImageView alloc] init];
    rightImage.hidden = YES;
    [self addSubview:rightImage];
    
    statusImage = [[UIImageView alloc] init];
    statusImage.hidden = YES;
    [self addSubview:statusImage];
    
    tipsNumLabel = [[UILabel alloc]init];
    tipsNumLabel.textColor = [UIColor whiteColor];
    tipsNumLabel.font = [UIFont systemFontOfSize:60];
    tipsNumLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:tipsNumLabel];
    tipsNumLabel.hidden = YES;
    
}

- (void)setStatus:(NSString *)status{
    
    _status = status;
    
    switch ([self.status integerValue]) {
        case UIRecordSoundStatusRecoding:{
            
            [self showViewWithRecording];
            
        }
            break;
        case UIRecordSoundStatusCancleSending:{
            
            [self showViewWithCancle];
            
        }
            break;
        case UIRecordSoundStatusRecordingShort:{
            
            [self showVieWithTimeShort];
            
        }
            break;
            
            
        default:
            break;
    }
    
}

- (void)setNumFontSize:(NSString *)numFontSize{
    if (numFontSize) {
        CGFloat tmpFont = [numFontSize floatValue];
        CGFloat font = tmpFont>0?tmpFont:60.0;
        tipsNumLabel.font = [UIFont systemFontOfSize:font];
    }
    _numFontSize = numFontSize;
}

- (void)setTime:(NSString *)time{
    if (time) {
        _time = time;
        NSLog(@"countDownTime:%@",time);
        if ([time integerValue]==0) {//显示时间过长
            [self showVieWithTimeLong];
        }else if([time integerValue]<10){
            tipsNumLabel.text = [NSString stringWithFormat:@"%@",time];
            if ([self.status integerValue] == UIRecordSoundStatusRecoding) {
                tipsNumLabel.hidden = NO;
                leftImage.hidden = YES;
                rightImage.hidden = YES;
            }
        }
    }
}

//设置音量
- (void)setLevel:(NSString *)level{
    
    _level = level;
    
    if ([self.status integerValue] == UIRecordSoundStatusRecoding) {
        NSString *imgNum = [NSString stringWithFormat:@"%f",[level floatValue]*7];
        rightImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"v%zd",[imgNum integerValue]]];
    }
}

- (void)layoutSubviews{
    NSLog(@"--layoutSubviews");
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    CGFloat viewH = self.frame.size.height;
    CGFloat viewW = self.frame.size.width;
    CGFloat tipsH = 30;
    CGFloat tipsY = viewH - tipsH - 5;
    CGFloat tipsX = 5;
    CGFloat tipsW = viewW - tipsX*2;
    tipLabel.frame = CGRectMake(tipsX, tipsY, tipsW, tipsH);
    
    CGFloat imgX = 20;
    CGFloat imgW = (viewW - 2*imgX)*0.5;
    CGFloat imgH = imgW*1.5;
    CGFloat imgY = tipsY - imgH;
    leftImage.frame = CGRectMake(imgX, imgY, imgW, imgH);
    statusImage.frame = CGRectMake(imgX, imgY, imgW*2, imgH);
    rightImage.frame = CGRectMake(imgX+imgW, imgY, imgW, imgH);
    tipsNumLabel.frame = statusImage.frame;
    
}

#pragma mark RecodeStatus

//正在录音

- (void)showViewWithRecording{
    tipLabel.text = @"手指上滑，取消录音";
    tipLabel.textColor = [UIColor whiteColor];
    tipLabel.backgroundColor = [UIColor clearColor];
    if (([_time integerValue] >0)&&([_time integerValue] <10)){
        tipsNumLabel.hidden = NO;
        leftImage.hidden = YES;
        rightImage.hidden = YES;
    }else{
        leftImage.image = [UIImage imageNamed:@"recorder"];
        rightImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"v%@",self.level]];
        leftImage.hidden = NO;
        rightImage.hidden = NO;
        tipsNumLabel.hidden = YES;
    }
    statusImage.hidden = YES;
}

//取消发送
- (void)showViewWithCancle{
    
    tipLabel.text = @"松开手指，取消录音";
    tipLabel.backgroundColor = [UIColor colorWithRed:0.7 green:0 blue:0 alpha:0.8];
    statusImage.image = [UIImage imageNamed:@"cancel"];
    leftImage.hidden = YES;
    rightImage.hidden = YES;
    statusImage.hidden = NO;
    tipsNumLabel.hidden = YES;
}

//时间过短
- (void)showVieWithTimeShort{
    tipLabel.text = @"说话时间太短";
    statusImage.image = [UIImage imageNamed:@"voice_to_short"];
    leftImage.hidden = YES;
    rightImage.hidden = YES;
    statusImage.hidden = NO;
    tipsNumLabel.hidden = YES;
}

//时间过长
- (void)showVieWithTimeLong{
    tipLabel.text = @"录音时间过长";
    statusImage.image = [UIImage imageNamed:@"voice_to_short"];
    leftImage.hidden = YES;
    rightImage.hidden = YES;
    statusImage.hidden = NO;
    tipsNumLabel.hidden = YES;
}

@end
