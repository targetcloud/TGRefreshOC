![Banners](https://github.com/targetcloud/TGRefreshOC/blob/master/logo.jpg)

  ## TGRefreshOC
弹簧、橡皮筋下拉刷新控件，类似QQ下拉刷新控件，但比QQ 更强，同时支持其他样式，目前总共2种样式，后续不断添加中...

![Build](https://img.shields.io/badge/build-passing-green.svg)
![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)
![Platform](https://img.shields.io/cocoapods/p/Pastel.svg?style=flat)
![Cocoapod](https://img.shields.io/badge/pod-v0.1.2-blue.svg)


## Recently Updated
- 0.1.3 增加ignoreScrollViewContentInsetTop属性
- 0.1.2 增加回显信息的渐显与渐隐时间属性设置
- 0.1.1 优化并增强容错设计处理
- 0.1.0 去掉了计时器，提高了性能，同时增加了容错性设计处理


## Features
- [x] 支持链式编程配置，程序员的最爱
- [x] 支持两种刷新结果提示
- [x] 支持QQ和Normal两种下拉刷新样式
- [x] 支持contentInset
- [x] 支持Cocoapods
- [x] 支持MJRefresh到TGRefresh风格切换，只需要把mj_header改为tg_header，改动2个字母即可
- [x] 支持4种配置方式，普通配置、一句话配置、高级配置、最优配置，推荐使用最优配置
- [x] 支持刷新结果回显配置
- [x] 超轻量级、使用超灵活、功能超强大
- [x] 用例丰富，快速上手


## Usage
首先写上这一句（必须的）
```
#import <TGRefresh.h>
```
如果需要，在你的控制器中加上一句
```
self.automaticallyAdjustsScrollViewInsets=NO;
```

### QQ效果
```
self.tableview.tg_header = [TGRefreshOC  refreshWithTarget:self action:@selector(doRefreshSenior) config:nil];
```

### 普通效果
```
    self.tableview.tg_header = [TGRefreshOC  refreshWithTarget:self action:@selector(doRefreshSenior) config:^(TGRefreshOC *refresh) {
        refresh.tg_kind(RefreshKindNormal);
    }];
```

### 更多配置，使用链式编程配置
```
    self.tableview.tg_header = [TGRefreshOC  refreshWithTarget:self action:@selector(doRefreshSenior) config:^(TGRefreshOC *refresh) {
        refresh.tg_refreshResultBgColor([[UIColor orangeColor] colorWithAlphaComponent:0.8])
        .tg_bgColor([UIColor colorWithWhite:0.8 alpha:1])
        .tg_refreshResultTextColor([UIColor whiteColor]);
    }];
```

### 开始刷新
```
[self.tableview.tg_header beginRefreshing];
```

### （网络请求等情况得到数据后）结束刷新
```
[self.tableview.tg_header endRefreshing];
```

### 结束刷新时的回显
```
        self.tableview.tg_header.refreshResultStr = @"成功刷新数据来自回显信息”;
        [self.tableview.tg_header endRefreshing];
```

### 可以配置的属性
```
/** 类型，默认为QQ弹簧 皮筋效果 */
@property(nonatomic,assign) TGRefreshKind kind;
/** 背景色（在有contentInset时为scrollview等背景色） */
@property(nonatomic,strong) UIColor * bgColor;
/** 主题色（刷新文字颜色、ActivityIndicator颜色、橡皮筯颜色） */
@property(nonatomic,strong) UIColor * tinColor;
/** 垂直对齐，默认顶部 */
@property(nonatomic,assign) TGRefreshAlignment verticalAlignment;
/** 刷新成功时的提示文字 */
@property(nonatomic,copy) NSString * refreshSuccessStr;
/** 准备刷新时的提示文字 */
@property(nonatomic,copy) NSString * refreshNormalStr;
/** 即将刷新时的提示文字 */
@property(nonatomic,copy) NSString * refreshPullingStr;
/** 正在刷新时的提示文字 */
@property(nonatomic,copy) NSString * refreshingStr;
/** 更新结果的回显文字 */
@property(nonatomic,copy) NSString * refreshResultStr;
/** 更新结果的回显背景色 */
@property(nonatomic,strong) UIColor * refreshResultBgColor;
/** 更新结果的回显文字颜色 */
@property(nonatomic,strong) UIColor * refreshResultTextColor;
/** 更新结果的回显高度 */
@property(nonatomic,assign) CGFloat refreshResultHeight;
/** 自动改变透明度，默认已做优化 */
@property(nonatomic,assign) BOOL automaticallyChangeAlpha;
/** 回显时的渐显时间 0.1 ～ 2秒 默认0.5 */
@property(nonatomic,assign) CGFloat fadeinTime;
/** 回显时的渐隐时间 0.1 ～ 5秒 默认1.5 */
@property(nonatomic,assign) CGFloat fadeoutTime;
/** 忽略初始的InsetTop */
@property(nonatomic,assign) BOOL ignoreScrollViewContentInsetTop;
```
#### 使用链式编程配置时，请在所有属性前加tg_前缀即可

### 更多使用配置组合效果请下载本项目或fork本项目查看

## Installation
- 下载并拖动TGRefreshOC到你的工程中，只需要拖动包含TGRefresh.h这一文件的目录即可

- Cocoapods
```
pod 'TGRefreshOC'
```

## Reference
- http://blog.csdn.net/callzjy
- https://github.com/targetcloud/baisibudejie

## 运行效果
![](https://github.com/targetcloud/baisibudejie/blob/master/refresha.gif) 

## demo中的弹簧效果
![](https://github.com/targetcloud/TGRefreshOC/blob/master/refresha.gif)

## demo中的Normal效果
![](https://github.com/targetcloud/TGRefreshOC/blob/master/refreshb.gif)

如果你觉得赞，请Star

<img src="https://github.com/targetcloud/TGRefreshOC/blob/master/Banners.png" width = "10%" hight = "10%"/>

