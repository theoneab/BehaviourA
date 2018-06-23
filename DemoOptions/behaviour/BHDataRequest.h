//
//  BHDataRequest.h
//  TJBehaviourAnalysis
//
//  Created by caiyunl on 2018/6/23.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void(^RequestCallback)(id  _Nullable responseObject, NSError *error);
@interface BHDataRequest : NSObject
+(void)get:(NSString *)url param:(NSDictionary *)param requestCallback:(RequestCallback)requestCallback;
+(void)getLogData:(NSString *)logid requestCallback:(RequestCallback)requestCallback;

+(void)get;
@end
