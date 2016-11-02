//
//  ViewController.m
//  MCUploadPrompt
//
//  Created by 123 on 16/11/1.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "ViewController.h"
#import "MCUpdateVersionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MCUpdateVersionView *view = [[MCUpdateVersionView alloc] init];
    view.versions = @"版本号";
    view.updataType = MCChooseUpdate; // 选择更新
//    view.updataType = MCCompelUpdata;// 强制更新
    view.content =@"更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多!!";
    [view show];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
