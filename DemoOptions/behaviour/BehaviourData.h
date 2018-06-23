//
//  BehaviourData.h
//  iOS-Echarts_iOS
//
//  Created by caiyunl on 2018/6/22.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogdataModel.h"

@interface TreeDataModel:NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic) NSInteger count;
@property(nonatomic,strong) NSMutableArray<LogdataModel *> *allLogData;
@property(nonatomic,strong) NSMutableArray<TreeDataModel *> *children;

@property(nonatomic) NSInteger level;
@end

@interface BehaviourData : NSObject
+(NSDictionary *)getTreeData;
+(NSDictionary *)dealTreeData;
@end
