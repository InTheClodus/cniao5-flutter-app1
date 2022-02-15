//
//  FTxSuperplayer.m
//  Pods
/**
 *      ┏┓     ┏┓
 *    ┏━┛┻━━━━━┛┻━┓
 *    ┃            ┃
 *    ┃     ━      ┃
 *    ┃  ┳┛   ┗┳  ┃
 *    ┃            ┃
 *    ┃     ┻      ┃
 *    ┃            ┃
 *    ┗━━┓     ┏━━┛Codes are far away from bugs with the animal protecting
 *       ┃　　　┃    神兽保佑,代码无bug
 *       ┃　　　┗━━━┓
 *       ┃         ┣━┓
 *       ┃         ┏━┛
 *       ┗┓┓┏━━┳┓┏━┛
 *        ┃┫┫  ┃┫┫
 *        ┗┻┛  ┗┻┛
 *
 *  Class Description:
        Input something to introduce this class.
 **/
 
//  Created by Ro on 2021/8/8.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.

        
#import "FTxSuperplayer.h"
#import <SuperPlayer/SuperPlayer.h>

@interface FTxSuperplayerController : NSObject<FlutterPlatformView, SuperPlayerDelegate>

@property (nonatomic, strong) SuperPlayerView           * playerView;
@property (nonatomic, strong) NSDictionary              * args;
@property (nonatomic, strong) UIView                    * fatherView;

- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args;

@end

@implementation FTxSuperplayerController {
    
}

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    if (self = [super init]) {
        self.args = args;
        
        [self setUp];
        
        self.fatherView.frame = frame;
    }
    return self;
}

- (void)setUp {
    NSString * pSign = self.args[@"pSign"];
    long appId = [self.args[@"appId"] longValue];
    NSString * fileId = self.args[@"fileId"];
    
    SuperPlayerModel *model = [[SuperPlayerModel alloc] init];
    model.appId = appId;// 配置 AppId
    model.videoId = [[SuperPlayerVideoId alloc] init];
    model.videoId.fileId = fileId; // 配置 FileId
    
    if (pSign.length) {
        // 开启防盗链需填写 psign，psign 即超级播放器签名，签名介绍和生成方式参见链接：https://cloud.tencent.com/document/product/266/42436
        model.videoId.psign = pSign;
    } else {
        // 不开防盗链
    }
    [self.playerView setFatherView:self.fatherView];
    [self.playerView playWithModel:model];
}

#pragma mark - Getter

- (SuperPlayerView *)playerView {
    if (!_playerView) {
        _playerView = [[SuperPlayerView alloc] init];
        // 设置代理，用于接受事件
        _playerView.delegate = self;
    }
    return _playerView;
}

- (UIView *)fatherView {
    if (!_fatherView) {
        _fatherView = [[UIView alloc] initWithFrame:CGRectZero];
        _fatherView.backgroundColor = [UIColor redColor];
    }
    return _fatherView;
}

#pragma mark - FlutterPlatformView Protocol

- (UIView *)view {
    return self.fatherView;
}

#pragma mark - SuperPlayerDelegate

/// 返回事件
- (void)superPlayerBackAction:(SuperPlayerView *)player {
    
}
/// 全屏改变通知
- (void)superPlayerFullScreenChanged:(SuperPlayerView *)player {
    
}
/// 播放开始通知
- (void)superPlayerDidStart:(SuperPlayerView *)player {
    
}
/// 播放结束通知
- (void)superPlayerDidEnd:(SuperPlayerView *)player {
    
}
/// 播放错误通知
- (void)superPlayerError:(SuperPlayerView *)player errCode:(int)code errMessage:(NSString *)why {
    NSLog(@"play error : %@", why);
}

@end

@implementation FTxSuperplayerFactory {
    
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args {
    FTxSuperplayerController * controller = [[FTxSuperplayerController alloc] initWithWithFrame:frame viewIdentifier:viewId arguments:args];
    NSLog(@"controller : %@, frame:(%@ , %@, %@, %@) viewId: %@, args: %@", controller, @(frame.origin.x), @(frame.origin.y), @(frame.size.width), @(frame.size.height), @(viewId), args);
    return controller;
}

- (NSObject<FlutterMessageCodec> *)createArgsCodec {
    return [FlutterStandardMessageCodec sharedInstance];
}

@end
