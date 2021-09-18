//
//  NSURL+Ex.h
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (Ex)
/**
 * 得到Url的参数
 */
- (NSMutableDictionary *)getURLParameters;
@end

NS_ASSUME_NONNULL_END
