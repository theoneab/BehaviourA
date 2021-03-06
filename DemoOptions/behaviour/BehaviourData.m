//
//  BehaviourData.m
//  iOS-Echarts_iOS
//
//  Created by caiyunl on 2018/6/22.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import "BehaviourData.h"
#import "LogdataModel.h"
#import <MJExtension/MJExtension.h>
#import "BHDataRequest.h"

@implementation TreeDataModel
@end

@implementation BehaviourData
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"children":[TreeDataModel class]};
}
+(NSDictionary *)getTreeData{
    
    TreeDataModel *re = [[TreeDataModel alloc]init];
    re.name = @"页面跳转";
    re.level = 0;
    [BehaviourData addChild:re];
    return [re mj_keyValues];;
}
+(void)addChild:(TreeDataModel *)re{
    NSArray *pageNames = @[@" ",@"landlord_unit_publish",@"landlord_unit_publish_list",@"home",@"landlord_mystuff",@"mystuff",@"favorites",@"app",@"unit_detail",@"search_home",@"chat_detail",@"search_suggestion"];
    NSInteger count = rand()%pageNames.count;
    re.children = [[NSMutableArray alloc]init];
    NSInteger percent = 0;
    while (count>=0 && percent != 100) {
        NSInteger index = rand()%pageNames.count;
        TreeDataModel *obj = [[TreeDataModel alloc]init];
        [re.children addObject:obj];
        NSInteger curPercent = rand()%(100 - percent) + 1;
        if (count == 0){
            curPercent = 100-percent;
        }
        obj.name = [[pageNames objectAtIndex:index] stringByAppendingFormat:@"   %ld%%",(long)curPercent];
        obj.level = re.level + 1;
        percent += curPercent;
        count--;
    }
    
    if (rand()%5 > 1 && re.level + 1 <= 2) {
        [re.children enumerateObjectsUsingBlock:^(TreeDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [BehaviourData addChild:obj];
        }];
    }
}

+ (NSDictionary *)dealTreeData{
    NSError *error;
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"file1" ofType:@"json"]] options:NSJSONReadingAllowFragments error:&error];
    NSArray<LogdataModel *> *objs = [LogdataModel mj_objectArrayWithKeyValuesArray:data];
    TreeDataModel *re = [[TreeDataModel alloc]init];
    re.name = objs[0].actpage;
    re.count = objs.count;
    re.allLogData = [[NSMutableArray alloc]initWithArray:objs];
    [BehaviourData queryNextPage:re];
    return [re mj_keyValues];
}

+(void)queryNextPage:(TreeDataModel *)data{
    data.children = [[NSMutableArray alloc]init];
    for(NSInteger i = 0,j = data.allLogData.count; i < j;i++){
        LogdataModel *obj = data.allLogData[i];
        if (![obj.refer isEqualToString:obj.logid]){
            [BHDataRequest getLogData:obj.logid requestCallback:^(id  _Nullable responseObject, NSError *error) {
                NSArray<LogdataModel *> *nextPages = [LogdataModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"actions"]];
                if (nextPages.count > 0){
                    [BehaviourData haveExsitPage:data.children logdata:nextPages[0]];
                }
            }];
        }
    }
   
    [data.children enumerateObjectsUsingBlock:^(TreeDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [BehaviourData queryNextPage:obj];
    }];
}

+(void)haveExsitPage:(NSMutableArray<TreeDataModel *> *)arr logdata:(LogdataModel *)logdata{
    if (arr.count == 0){
        TreeDataModel *re = [[TreeDataModel alloc]init];
        re.name = logdata.actpage;
        re.count = 1;
        re.allLogData = [[NSMutableArray alloc]initWithObjects:logdata, nil];
        [arr addObject:re];
    }
    
    [arr enumerateObjectsUsingBlock:^(TreeDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([logdata.actpage isEqualToString: obj.name]){
            obj.count += 1;
            if( obj.allLogData.count > 0 ){
                [obj.allLogData addObject:logdata];
            }else{
                obj.allLogData = [[NSMutableArray alloc]initWithObjects:logdata, nil];
            }
        }else{
            TreeDataModel *re = [[TreeDataModel alloc]init];
            re.name = obj.name;
            re.count = 1;
            re.allLogData = [[NSMutableArray alloc]initWithObjects:logdata, nil];
            [arr addObject:re];
        }
    }];
}

@end
