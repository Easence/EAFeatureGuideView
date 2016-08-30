# EAFeatureGuideView 
============
##EAFeatureGuideView能做什么
EAFeatureGuideView是UIView的一个扩展，用来做新功能引导提示，达到这样的效果：
- 局部区域高亮（可以设置圆角）
- 有箭头指向高亮区域
- 可以设置一段介绍文字（可以是图片、也可以是文字）
- 可以对应一个按钮，可以通过配置事件、标题。
最后的效果如下：
![效果图1](http://upload-images.jianshu.io/upload_images/1801567-4d5983810f9c2e05.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![效果图2](http://upload-images.jianshu.io/upload_images/1801567-fe1c6bb25ae34cd8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##如何使用
如果安装了Cocoapods,可以在Podfile中加入如下代码：
```pod 'EAFeatureGuideView'```,接着```pod install```一下。
接着在需要展示提示的页面引入头文件：
```#import "UIView+EAFeatureGuideView.h"```
最后添加如下代码：
```
EAFeatureItem *item = [[EAFeatureItem alloc] initWithFocusView:self.exampleCell focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
item.introduce = @"txt_feature_post_activity_4.1.png";
item.actionTitle = @"太好了";
item.action = ^(id sender){
        NSLog(@"touched ..");  
    };

EAFeatureItem *recents = [[EAFeatureItem alloc] initWithFocusRect:CGRectMake(centerX - 25, centerY - 25, 50, 50) focusCornerRadius:25 focusInsets:UIEdgeInsetsZero];    
recents.introduce = @"recents";

[self.navigationController.view showWithFeatureItems:@[item, recents] saveKeyName:@"keyName" inVersion:nil];
```
##可以优化的地方
- 介绍文案没有支持多颜色。
- 当高亮区域是圆形的时候，箭头的指向没有对中圆心。
- 旋转屏幕的时候，EAFeatureItem是一个rect的时候，不能自动的重新布局。

