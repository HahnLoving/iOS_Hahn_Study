//
//  SceneDelegate+Scheme.m
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import "SceneDelegate+Scheme.h"
#import "NSURL+Ex.h"
#import "LinkModel.h"

@implementation SceneDelegate (Scheme)

// 冷启动调用
- (void)scheme:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions
{
    // 冷启动的时候，需要等初始化完成
    for (UIOpenURLContext *context in connectionOptions.URLContexts) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.50 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSString *url = context.URL.host;
            NSDictionary *paras = [context.URL getURLParameters];
            NSLog(@"SceneDelegate scheme url = %@",url);
            NSLog(@"SceneDelegate scheme 参数 = %@", paras);
            
            LinkModel *model = [LinkModel new];
            model.url = url;
            model.para = paras;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"Scheme" object:model];
        });
    }
}

// 热启动调用
- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts
{
    NSString *url = URLContexts.allObjects.firstObject.URL.host;
    NSDictionary *paras = [URLContexts.allObjects.firstObject.URL getURLParameters];
    NSLog(@"SceneDelegate scheme url = %@",url);
    NSLog(@"SceneDelegate scheme 参数 = %@", paras);
    
    LinkModel *model = [LinkModel new];
    model.url = url;
    model.para = paras;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Scheme" object:model];
}

@end
