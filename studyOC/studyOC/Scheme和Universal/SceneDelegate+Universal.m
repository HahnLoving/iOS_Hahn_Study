//
//  SceneDelegate+Universal.m
//  studyOC
//
//  Created by Hahn on 2021/9/17.
//

#import "SceneDelegate+Universal.h"
#import "NSURL+Ex.h"
#import "LinkModel.h"

@implementation SceneDelegate (Universal)
- (void)scene:(UIScene *)scene continueUserActivity:(NSUserActivity *)userActivity API_AVAILABLE(ios(13.0))
{
  // 处理逻辑
    NSString *url = userActivity.webpageURL.host;
    NSDictionary *paras = [userActivity.webpageURL getURLParameters];
    NSLog(@"SceneDelegate universal url = %@",url);
    NSLog(@"SceneDelegate universal 参数 = %@", paras);
    
    LinkModel *model = [LinkModel new];
    model.url = url;
    model.para = paras;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Universal" object:model];
}
@end
