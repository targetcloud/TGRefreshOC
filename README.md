![Banners](https://github.com/targetcloud/TGRefreshOC/blob/master/logo.jpg)

## TGRefreshOC
弹簧、橡皮筋下拉刷新控件，类似QQ下拉刷新控件，但比QQ 更强，同时支持其他样式，目前总共2种样式，后续不断添加中...

![Build](https://img.shields.io/badge/build-passing-green.svg)
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/VeinGuo/VGPlayer/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/Pastel.svg?style=flat)](https://github.com/VeinGuo/VGPlayer)
[![Cocoapod](https://img.shields.io/badge/pod-v0.0.2-blue.svg)](http://cocoadocs.org/docsets/VGPlayer/0.0.1/)

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
首先写上这一句
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

### 更多使用配置请下载或fork

## Installation
- 下载并拖动TGRefreshOC到你的工程中，只需要拖动包含TGRefresh.h这一文件的目录即可

- Cocoapods
```
pod 'TGRefreshOC'
```

## Reference
- http://blog.csdn.net/callzjy

## License
MIT

如果你觉得赞，请Star

<img src="https://github.com/targetcloud/TGRefreshOC/blob/master/Banners.png" width = "10%" hight = "10%"/>

