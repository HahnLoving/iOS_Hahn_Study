//
//  AppDelegate+Universal.m
//  studyOC
//
//  Created by Hahn on 2021/9/17.
//

#import "AppDelegate+Universal.h"
#import "NSURL+Ex.h"
#import "LinkModel.h"

@implementation AppDelegate (Universal)

- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler
{
    // 因为使用了观察者，冷启动的时候，需要等初始化完成
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.50 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSString *hostUrl = userActivity.webpageURL.host;
        NSDictionary *paras = [userActivity.webpageURL getURLParameters];
        NSLog(@"AppDelegate universal url = %@",hostUrl);
        NSLog(@"AppDelegate universal 参数 = %@", paras);
        
        LinkModel *model = [LinkModel new];
        model.url = hostUrl;
        model.para = paras;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Universal" object:model];
    });
    return YES;
    return YES;
}

@end
