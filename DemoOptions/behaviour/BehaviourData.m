//
//  BehaviourData.m
//  iOS-Echarts_iOS
//
//  Created by caiyunl on 2018/6/22.
//  Copyright © 2018年 pluto-y. All rights reserved.
//

#import "BehaviourData.h"
#import <MJExtension/MJExtension.h>

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
@end
