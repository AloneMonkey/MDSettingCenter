//
//  SettingsViewController.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDSettingsViewController.h"
#import "MDConstants.h"
#import "MDColor.h"
#import "MDSuspendBall.h"
#import "UIView+Frame.h"
#import "MDTableViewData.h"
#import "MDTableViewCell.h"
#import "MDTableViewGroup.h"
#import <Masonry/Masonry.h>

@interface MDSettingsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MDSuspendBall* suspendBall;

@property (nonatomic, strong) UITableView* tableview;

@property (nonatomic, strong) UILabel* copyright;

@property (nonatomic, strong) UIBarButtonItem *closeButtonItem;

@property (nonatomic, strong) NSMutableArray<MDTableViewGroup*> *tableData;

@end

@implementation MDSettingsViewController

+ (instancetype)sharedInstance {
    static MDSettingsViewController *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MDSettingsViewController alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableData = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"插件配置";
    
    self.view.backgroundColor = MDColorBackGround;
    
    [self setupSubViews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.suspendBall.hidden = YES;
}

#pragma mark - setup view

-(void)setupSubViews{
    _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableview.backgroundColor = MDColorBackGround;
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.scrollEnabled = YES;
    _tableview.rowHeight = 50;
    [self.view addSubview:_tableview];
    
    _copyright = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MDScreenWidth, 30)];
    _copyright.text = MD_COPYRIGHT;
    _copyright.textColor = MDColorCopyRight;
    _copyright.font = MDFont12;
    _copyright.textAlignment = NSTextAlignmentCenter;
    _tableview.tableFooterView = _copyright;
    
    [self.navigationItem setRightBarButtonItem:[self closeButtonItem]];
}

- (UIBarButtonItem *)closeButtonItem {
    if (!_closeButtonItem) {
        UIBarButtonItem *closeButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(MD_DONE, nil) style:UIBarButtonItemStylePlain target:self action:@selector(exit)];
        _closeButtonItem = closeButtonItem;
    }
    return _closeButtonItem;
}

#pragma mark - Getter & Setter

-(MDSuspendBall *)suspendBall{
    if(_suspendBall){
        return _suspendBall;
    }else{
        return [MDSuspendBall sharedInstance];
    }
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tableData[section].cells.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _tableData[section].title;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return _tableData[section].footer;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MDTableViewData *data = _tableData[indexPath.section].cells[indexPath.row];
    MDTableViewCell *cell = [[data.cellClass alloc] init];
    if (data.customCellBlock) {
        cell.data = data;
        data.customCellBlock(cell);
    }
    return cell;
}

#pragma mark - UITableViewDelegate

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSString *text = _tableData[section].title;
    if(text.length > 0){
        UILabel* headerView = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, 0, MDScreenWidth, 40)];
        headerView.backgroundColor = MDColorBackGround;
        headerView.font = MDFont14;
        headerView.textColor = MDColorGray;
        NSString *text = _tableData[section].title;
        NSMutableAttributedString * attrString = [[NSMutableAttributedString  alloc] initWithString:text];
        NSMutableParagraphStyle * style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        style.firstLineHeadIndent = kLeftMargin;
        style.alignment = NSTextAlignmentLeft;
        [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
        headerView.attributedText = attrString;
        return headerView;
    }
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    NSString *text = _tableData[section].footer;
    if(text.length > 0){
        UILabel* footerView = [[UILabel alloc] initWithFrame:CGRectMake(kLeftMargin, 0, MDScreenWidth, 40)];
        footerView.backgroundColor = MDColorBackGround;
        footerView.font = MDFont12;
        footerView.textColor = MDColorGray;
        NSMutableAttributedString * attrString = [[NSMutableAttributedString  alloc] initWithString:text];
        NSMutableParagraphStyle * style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        style.firstLineHeadIndent = kLeftMargin;
        style.alignment = NSTextAlignmentLeft;
        [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
        footerView.attributedText = attrString;
        return footerView;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MDTableViewData* data = _tableData[indexPath.section].cells[indexPath.row];
    if(data.selectCellBlock){
        data.selectCellBlock();
    }
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - private

-(void)exit{
    self.suspendBall.hidden = NO;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addTableViewGroup:(MDTableViewGroup *)group{
    [_tableData addObject:group];
}

@end
