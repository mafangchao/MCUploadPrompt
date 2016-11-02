# MCUploadPrompt
常用的应用升级提示
# 使用方法:
MCUpdateVersionView *view = [[MCUpdateVersionView alloc] init];
view.versions = @"版本号";
view.updataType = MCChooseUpdate; // 选择更新
//    view.updataType = MCCompelUpdata;// 强制更新
view.content =@"更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多,更新中的数据内容,你这个都是在服务器端获取的,文字可以很多!!";
[view show];

![image](https://github.com/mafangchao/MCUploadPrompt/blob/master/BE532486-F4B1-4697-BD0C-D9A132D7754B.png)
