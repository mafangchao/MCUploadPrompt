//
//  CYBUpdateVersionView.h
//  myApp
//
//  Created by 123 on 16/10/17.
//  Copyright © 2016年 careerman. All rights reserved.
//

#import <UIKit/UIKit.h>
/// 更新类型
typedef enum {
    MCCompelUpdata = 0,      //强制更新
    MCChooseUpdate= 1,       //选择更新
} MCUpdateType;

@interface MCUpdateVersionView : UIView
/// 版本号
@property(nonatomic,copy)NSString *versions;
/// 更新内容
@property(nonatomic,copy)NSString *content;
/// 更新方式
@property(nonatomic,assign)MCUpdateType updataType;

-(void)show;

@end
