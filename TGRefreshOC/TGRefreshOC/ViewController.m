//
//  ViewController.m
//  TGRefreshOC
//
//  Created by targetcloud on 2017/6/19.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

#import "ViewController.h"
#import "TGRefreshOC.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tv;
@property (nonatomic ,weak) TGRefreshOC *refreshCtl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tv.dataSource = self;
    self.tv.delegate = self;
    self.tv.tableFooterView = [UIView new];
    self.tv.allowsSelection = NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //[self builderAndSetting];
    [self builderSimple];
}

-(void)builderSimple{
    TGRefreshOC *refresh = [[TGRefreshOC alloc] initWithConfig:^(TGRefreshOC *refresh) {
        refresh.tg_refreshResultBgColor([[UIColor orangeColor] colorWithAlphaComponent:0.8])
               .tg_bgColor([UIColor colorWithWhite:0.8 alpha:1])
               .tg_refreshResultTextColor([UIColor whiteColor]);
    }];
    
    [self.tv addSubview:refresh];
    _refreshCtl = refresh;
    [refresh addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];
    [refresh beginRefreshing];//一进入界面需要刷新写这一行
}

-(void)builderAndSetting{
    //******************有contentInset测试****************
    //可以去掉这段
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor lightGrayColor];
    label.frame = CGRectMake(0, -80, ScreenW, 80);
    label.font = [UIFont systemFontOfSize:13];
    label.numberOfLines = 0;
    label.textColor = [UIColor whiteColor];
    label.text = @"TGRefreshOC下拉刷新控件是一款同时支持QQ样式（橡皮筋）和普通样式的下拉刷新控件。支持链式配置,使用更简单。配置参数更多更灵活。 快来使用一下吧，比你想象中更强大哦:）";
    label.textAlignment = NSTextAlignmentCenter;
    [self.tv addSubview:label];
    self.tv.contentInset = UIEdgeInsetsMake(80, 0, 0, 0);
    //***************************************************
    
    TGRefreshOC *refresh = [TGRefreshOC new];
    //    refresh.kind = RefreshKindNormal;//QQ效果则注释此行
    
    //配置根据需要写，也可以不写任何配置
    //*****************普通配置***************************
    //与下面链式配置二选一，也可以一起写
    refresh.bgColor =  [UIColor colorWithWhite:0.8 alpha:1];
    refresh.verticalAlignment = TGRefreshAlignmentTop;
    refresh.automaticallyChangeAlpha = YES;
    //***************************************************
    
    //*****************链式配置***************************
    //与上面普通配置二选一，也可以一起写
    refresh.tg_refreshResultBgColor([[UIColor orangeColor] colorWithAlphaComponent:0.8])
    .tg_refreshResultTextColor([UIColor whiteColor])
    .tg_refreshResultHeight(38)
    .tg_refreshNormalStr(@"pull down refresh")
    .tg_refreshPullingStr(@"let go")
    .tg_refreshingStr(@"refreshing...")
    .tg_refreshSuccessStr(@"success");
    //***************************************************
    
    [self.tv addSubview:refresh];
    _refreshCtl = refresh;
    [refresh addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];
    [refresh beginRefreshing];//一进入界面需要刷新写这一行
}

- (void)doRefresh{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _refreshCtl.refreshResultStr = @"成功刷新到10条数据";
        [_refreshCtl endRefreshing];
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行测试数据",indexPath.row];
    return cell;
}

/*
 测试24种组合
 无对齐，默认对齐（上）    无contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 中对齐                 无contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 下对齐                 无contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 
 无对齐，默认对齐（上）    无contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 中对齐                 无contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 下对齐                 无contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 
 无对齐，默认对齐（上）    有contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 中对齐                 有contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 下对齐                 有contentInset    normal类型    automaticallyChangeAlpha（NO）- ok
 
 无对齐，默认对齐（上）    有contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 中对齐                 有contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 下对齐                 有contentInset    normal类型    automaticallyChangeAlpha（YES）- ok
 
 无对齐，默认对齐（上）    无contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 中对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 下对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 
 无对齐，默认对齐（上）    无contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 中对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 下对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 
 无对齐，默认对齐（上）    有contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 中对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 下对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（NO）- ok
 
 无对齐，默认对齐（上）    有contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 中对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 下对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（YES）- ok
 */



@end
