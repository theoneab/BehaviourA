//
//  PYTreeDemoOptions.m
//  iOS-Echarts
//
//  Created by Pluto Y on 9/11/16.
//  Copyright © 2016 pluto-y. All rights reserved.
//

#import "PYTreeDemoOptions.h"
#import "BehaviourData.h"

@implementation PYTreeDemoOptions

+ (PYOption *)tree1Option {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"树图").subtextEqual(@"虚构数据");
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.show = YES;
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(YES);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(NO)
        .addSeries([PYTreeSeries initPYTreeSeriesWithBlock:^(PYTreeSeries *s) {
            s.rootLocationEqual(@{@"x":@"center", @"y":@50}).nodePaddingEqual(@1).nameEqual(@"树图").typeEqual(PYSeriesTypeTree)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(NO).formatterEqual(@"{b}");
                    }])
                    .lineStyleEqual([PYLineStyle initPYLineStyleWithBlock:^(PYLineStyle *lineStyle) {
                        lineStyle.colorEqual([PYColor colorWithHexString:@"#48b"])
                        .shadowColorEqual([PYColor colorWithHexString:@"#000"])
                        .shadowBlurEqual(@3)
                        .shadowOffsetXEqual(@3)
                        .shadowOffsetYEqual(@5)
                        .typeEqual(PYLineStyleTypeCurve);
                    }]);
                }])
                .emphasisEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *emphasis) {
                    emphasis.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES);
                    }]);
                }]);
            }])
            .addData(@{@"name":@"根节点", @"value":@6, @"children":@[@{@"name":@"节点1", @"value":@4, @"children":@[@{@"name":@"叶子节点1", @"value":@4}, @{@"name":@"叶子节点2", @"value":@4}, @{@"name":@"叶子节点3", @"value":@2}, @{@"name":@"叶子节点4", @"value":@2}, @{@"name":@"叶子节点5", @"value":@2}, @{@"name":@"叶子节点6", @"value":@4}]}, @{@"name":@"节点2", @"value":@4, @"children":@[@{@"name":@"叶子节点7", @"value":@4}, @{@"name":@"叶子节点8", @"value":@4}]}, @{@"name":@"节点3", @"value":@1, @"children":@[@{@"name":@"叶子节点9", @"value":@4}, @{@"name":@"叶子节点10", @"value":@4}, @{@"name":@"叶子节点11", @"value":@2}, @{@"name":@"叶子节点12", @"value":@2}]}]});
        }]);
    }];
}

+ (PYOption *)tree2Option {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        NSError *err;
        NSDictionary *dic = [BehaviourData getTreeData];
//        dic = [BehaviourData dealTreeData];
        if(err) {
            NSLog(@"json解析失败：%@",err);
            return;
        }
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"页面跳转");
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.show = YES;
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(YES);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .addSeries([PYTreeSeries initPYTreeSeriesWithBlock:^(PYTreeSeries *series) {
            series.orientEqual(PYOrientHorizontal)
            .rootLocationEqual(@{@"x":@0, @"y":@60})
            .nodePaddingEqual(@8)
            .layerPaddingEqual(@0)
            .hoverableEqual(NO)
            .roamEqual(@YES)
            .symbolSizeEqual(@10)
            .nameEqual(@"树图")
            .typeEqual(PYSeriesTypeTree)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.colorEqual([PYColor colorWithHexString:@"#4883b4"])
                    .labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES)
                        .positionEqual(PYPositionRight)
                        .formatterEqual(@"{b}")
                        .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                            textStyle.colorEqual([PYColor colorWithHexString:@"#000"])
                            .fontSizeEqual(@5);
                        }]);
                    }])
                    .lineStyleEqual([PYLineStyle initPYLineStyleWithBlock:^(PYLineStyle *lineStyle) {
                        lineStyle.colorEqual([PYColor colorWithHexString:@"#ccc"])
                        .typeEqual(PYLineStyleTypeCurve);
                    }]);
                }])
                .emphasisEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *emphasis) {
                    emphasis.colorEqual([PYColor colorWithHexString:@"#4883b4"])
                    .labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(NO);
                    }])
                    .borderWidthEqual(@0);
                }]);
            }])
            .addDataArr(@[dic]);
        }]);
    }];
}

+ (PYOption *)tree3Option {
    return [PYOption initPYOptionWithBlock:^(PYOption *option) {
        NSDictionary *dataDic = @{
                                  @"name":@"手机",
                                  @"value":@6,
                                  @"symboSize":@[@90, @70],
                                  @"symbol":@"image://http://www.iconpng.com/png/ecommerce-business/iphone.png",
                                  @"itemStyle":@{
                                          @"normal":
                                              @{
                                                  @"label":@{
                                                          @"show":@NO
                                                          }
                                                  }
                                          },
                                  @"children":@[
                                          @{
                                              @"name":@"小米",
                                              @"value":@4,
                                              @"symbol":@"image://http://pic.58pic.com/58pic/12/36/51/66d58PICMUV.jpg",
                                              @"itemStyle":@{
                                                      @"normal":
                                                          @{
                                                              @"label":@{
                                                                      @"show":@NO
                                                                      }
                                                              }
                                                      },
                                              @"symbolSize": @[@60, @60],
                                              @"children": @[
                                                      @{
                                                          @"name":@"小米1",
                                                          @"symbol":PYSymbolCircle,
                                                          @"symbolSize":@20,
                                                          @"value":@4,
                                                          @"itemStyle":@{
                                                                  @"normal":@{
                                                                          @"color":@"#fa6900",
                                                                          @"label":@{
                                                                                  @"show":@YES,
                                                                                  @"position":@"right"
                                                                                  }
                                                                          }
                                                                  },
                                                          @"emphasis":@{
                                                                  @"label":@{
                                                                          @"show":@NO
                                                                          },
                                                                  @"borderWidth":@0
                                                                  }
                                                          },
                                                      @{
                                                          @"name":@"小米2",
                                                          @"value":@4,
                                                          @"symbol":PYSymbolCircle,
                                                          @"symbolSize":@20,
                                                          @"itemStyle":@{
                                                                  @"normal":@{
                                                                          @"label":@{
                                                                                  @"show":@YES,
                                                                                  @"position":@"right",
                                                                                  @"formatter":@"{b}"
                                                                                  },
                                                                          @"color":@"#fa6900",
                                                                          @"borderWidth":@2,
                                                                          @"borderColor":@"#cc66ff"
                                                                          },
                                                                  @"emphasis":@{
                                                                          @"borderWidth":@0
                                                                          }
                                                                  }
                                                          
                                                          },
                                                      @{
                                                          @"name":@"小米3",
                                                          @"value":@2,
                                                          @"symbol":PYSymbolCircle,
                                                          @"symbolSize":@20,
                                                          @"itemStyle":@{
                                                                  @"normal":@{
                                                                          @"label":@{
                                                                                  @"position":@"right"
                                                                                  },
                                                                          @"color":@"#fa6900",
                                                                          @"brushType":@"stroke",
                                                                          @"borderWidth":@1,
                                                                          @"borderColor":@"#999966"
                                                                          },
                                                                  @"emphasis":@{
                                                                          @"borderWidth":@0
                                                                          }
                                                                  }
                                                          }
                                                      ]
                                              },
                                          @{
                                              @"name":@"苹果",
                                              @"symbol":@"image://http://www.viastreaming.com/images/apple_logo2.png",
                                              @"symbolSize":@[@60, @60],
                                              @"itemStyle":@{
                                                      @"normal":@{
                                                              @"label":@{
                                                                      @"show":@NO
                                                                      }
                                                              }
                                                      },
                                              @"value":@4
                                              
                                              },
                                          @{
                                              @"name":@"华为",
                                              @"symbol":@"image://http://market.huawei.com/hwgg/logo_cn/download/logo.jpg",
                                              @"symbolSize":@[@60, @60],
                                              @"itemStyle":@{
                                                      @"normal":@{
                                                              @"label":@{
                                                                      @"show":@NO
                                                                      }
                                                              }
                                                      },
                                              @"value":@2
                                              },
                                          @{
                                              @"name":@"联想",
                                              @"symbol":@"image://http://www.lenovo.com.cn/HomeUpload/Home001/6d94ee9a20140714.jpg",
                                              @"symbolSize":@[@100, @40],
                                              @"itemStyle":@{
                                                      @"normal":@{
                                                              @"label":@{
                                                                      @"show":@NO
                                                                      }
                                                              }
                                                      },
                                              @"value":@2
                                              }
                                          ]
                                  };
        option.titleEqual([PYTitle initPYTitleWithBlock:^(PYTitle *title) {
            title.textEqual(@"手机品牌")
            .subtextEqual(@"线、节点样式");
        }])
        .tooltipEqual([PYTooltip initPYTooltipWithBlock:^(PYTooltip *tooltip) {
            tooltip.triggerEqual(PYTooltipTriggerItem)
            .formatterEqual(@"{b}: {c}");
        }])
        .toolboxEqual([PYToolbox initPYToolboxWithBlock:^(PYToolbox *toolbox) {
            toolbox.showEqual(YES)
            .featureEqual([PYToolboxFeature initPYToolboxFeatureWithBlock:^(PYToolboxFeature *feature) {
                feature.markEqual([PYToolboxFeatureMark initPYToolboxFeatureMarkWithBlock:^(PYToolboxFeatureMark *mark) {
                    mark.show = YES;
                }])
                .dataViewEqual([PYToolboxFeatureDataView initPYToolboxFeatureDataViewWithBlock:^(PYToolboxFeatureDataView *dataView) {
                    dataView.showEqual(YES).readOnlyEqual(YES);
                }])
                .restoreEqual([PYToolboxFeatureRestore initPYToolboxFeatureRestoreWithBlock:^(PYToolboxFeatureRestore *restore) {
                    restore.showEqual(YES);
                }]);
            }]);
        }])
        .calculableEqual(NO)
        .addSeries([PYTreeSeries initPYTreeSeriesWithBlock:^(PYTreeSeries *series) {
            series.orientEqual(PYOrientHorizontal)
            .rootLocationEqual(@{@"x":@0, @"y":@"50%"})
            .nodePaddingEqual(@5)
            .symbolEqual(PYSymbolCircle)
            .symbolSizeEqual(@20)
            .nameEqual(@"树图")
            .typeEqual(PYSeriesTypeTree)
            .itemStyleEqual([PYItemStyle initPYItemStyleWithBlock:^(PYItemStyle *itemStyle) {
                itemStyle.normalEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *normal) {
                    normal.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES)
                        .positionEqual(@"inside")
                        .textStyleEqual([PYTextStyle initPYTextStyleWithBlock:^(PYTextStyle *textStyle) {
                            textStyle.colorEqual([PYColor colorWithHexString:@"#cc9999"])
                            .fontSizeEqual(@15)
                            .fontWeightEqual(PYTextStyleFontWeightBolder);
                        }]);
                    }])
                    .lineStyleEqual([PYLineStyle initPYLineStyleWithBlock:^(PYLineStyle *lineStyle) {
                        lineStyle.colorEqual([PYColor colorWithHexString:@"#000"])
                        .widthEqual(@1)
                        .typeEqual(PYLineStyleTypeBroken);
                    }]);
                }])
                .emphasisEqual([PYItemStyleProp initPYItemStylePropWithBlock:^(PYItemStyleProp *emphasis) {
                    emphasis.labelEqual([PYLabel initPYLabelWithBlock:^(PYLabel *label) {
                        label.showEqual(YES);
                    }]);
                }]);
            }])
            .addDataArr(@[dataDic]);
        }]);
    }];
}

@end
