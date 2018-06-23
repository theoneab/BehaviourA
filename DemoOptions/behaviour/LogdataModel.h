//
//  LogdataModel.h
//  TJBehaviourAnalysis
//
//  Created by caiyunl on 2018/6/23.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogdataModel : NSObject
@property(nonatomic) NSInteger level;
@property(nonatomic,strong) NSString *uid;
@property(nonatomic,strong) NSString *userid;
@property(nonatomic,strong) NSString *actitemtext;

@property(nonatomic,strong) NSString *actpage;
@property(nonatomic,strong) NSString *acttime;
@property(nonatomic,strong) NSString *logid;
@property(nonatomic,strong) NSString *refpage;
@property(nonatomic,strong) NSString *refer;
@end
