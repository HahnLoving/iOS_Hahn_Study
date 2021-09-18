//
//  AppDelegate+Scheme.m
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import "AppDelegate+Scheme.h"
#import "NSURL+Ex.h"
#import "LinkModel.h"

@implementation AppDelegate (Scheme)

// 热启动 冷启动 调用
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    // 因为使用了观察者，冷启动的时候，需要等初始化完成
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.50 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *hostUrl = url.host;
        NSDictionary *paras = [url getURLParameters];
        NSLog(@"AppDelegate scheme url = %@",hostUrl);
        NSLog(@"AppDelegate scheme 参数 = %@", paras);
        
        LinkModel *model = [LinkModel new];
        model.url = hostUrl;
        model.para = paras;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Scheme" object:model];
    });
    return YES;
}


@end
