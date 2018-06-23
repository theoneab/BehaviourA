//
//  BehaviourData.h
//  iOS-Echarts_iOS
//
//  Created by caiyunl on 2018/6/22.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface TreeDataModel:NSObject
@property(nonatomic) NSInteger level;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSMutableArray<TreeDataModel *> *children;
@end

@interface BehaviourData : NSObject
+(NSDictionary *)getTreeData;
@end
