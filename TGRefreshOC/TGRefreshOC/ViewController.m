//
//  ViewController.m
//  TGRefreshOC
//
//  Created by targetcloud on 2017/6/19.
//  Copyright © 2017年 targetcloud. All rights reserved.
//

#import "ViewController.h"
#import "TGRefreshOC.h"

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
//    self.tv.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    TGRefreshOC *refresh = [TGRefreshOC new];
        refresh.kind = RefreshKindNormal;
    refresh.bgColor =  [UIColor colorWithWhite:0.8 alpha:1];
    refresh.verticalAlignment = TGRefreshAlignmentMidden;
    refresh.automaticallyChangeAlpha = YES;
    [self.tv addSubview:refresh];
    _refreshCtl = refresh;
    [refresh addTarget:self action:@selector(doRefresh) forControlEvents:UIControlEventValueChanged];
    [refresh beginRefreshing];
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
 无对齐，默认对齐（上）    无contentInset    normal类型    automaticallyChangeAlpha（NO）
 中对齐                 无contentInset    normal类型    automaticallyChangeAlpha（NO）
 下对齐                 无contentInset    normal类型    automaticallyChangeAlpha（NO）
 
 无对齐，默认对齐（上）    无contentInset    normal类型    automaticallyChangeAlpha（YES）
 中对齐                 无contentInset    normal类型    automaticallyChangeAlpha（YES）
 下对齐                 无contentInset    normal类型    automaticallyChangeAlpha（YES）
 
 无对齐，默认对齐（上）    有contentInset    normal类型    automaticallyChangeAlpha（NO）
 中对齐                 有contentInset    normal类型    automaticallyChangeAlpha（NO）
 下对齐                 有contentInset    normal类型    automaticallyChangeAlpha（NO）
 
 无对齐，默认对齐（上）    有contentInset    normal类型    automaticallyChangeAlpha（YES）
 中对齐                 有contentInset    normal类型    automaticallyChangeAlpha（YES）
 下对齐                 有contentInset    normal类型    automaticallyChangeAlpha（YES）
 
 无对齐，默认对齐（上）    无contentInset    QQ类型        automaticallyChangeAlpha（NO）
 中对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（NO）
 下对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（NO）
 
 无对齐，默认对齐（上）    无contentInset    QQ类型        automaticallyChangeAlpha（YES）
 中对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（YES）
 下对齐                 无contentInset    QQ类型        automaticallyChangeAlpha（YES）
 
 无对齐，默认对齐（上）    有contentInset    QQ类型        automaticallyChangeAlpha（NO）
 中对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（NO）
 下对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（NO）
 
 无对齐，默认对齐（上）    有contentInset    QQ类型        automaticallyChangeAlpha（YES）
 中对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（YES）
 下对齐                 有contentInset    QQ类型        automaticallyChangeAlpha（YES）
 */



@end
