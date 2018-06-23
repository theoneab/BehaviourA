//
//  BHDataRequest.m
//  TJBehaviourAnalysis
//
//  Created by caiyunl on 2018/6/23.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import "BHDataRequest.h"

@implementation BHDataRequest
+(void)get:(NSString *)url param:(NSDictionary *)param requestCallback:(RequestCallback)requestCallback{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    [manager GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success");
        requestCallback(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
        requestCallback(nil,error);
    }];
}

+(void)getLogData:(NSString *)logid requestCallback:(RequestCallback)requestCallback{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    //http://10.2.50.110:5000/refactions/167b1e1a-177a-41c2-b160-96a572f75464
    [manager GET:[[NSString alloc]initWithFormat:@"http://10.2.50.110:5000/refactions/%@",logid]  parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        requestCallback(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        requestCallback(nil,error);
    }];
}

+(void)get{
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dict = @{
                           @"username":@"520it",
                           @"pwd":@"520it"
                           };
    // parameters 参数字典
    [manager GET:@"http://10.2.50.110:5000/actions/00000000-5aaf-6c2a-7c07-f71f269d576b" parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        //进度
        //进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"cdewvr");
        // task 我们可以通过task拿到响应头
        // responseObject:请求成功返回的响应结果（AFN内部已经把响应体转换为OC对象，通常是字典或数组)
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"cdewvr");
        // error 错误信息
    }];
}
@end
