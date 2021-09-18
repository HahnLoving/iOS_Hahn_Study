//
//  LinkModel.h
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinkModel : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSDictionary *para;

@end

NS_ASSUME_NONNULL_END
