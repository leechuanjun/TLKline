//
//  ViewController.m
//  TLKline
//
//  Created by lichuanjun on 15/9/25.
//  Copyright © 2015年 lichuanjun. All rights reserved.
//

#import "ViewController.h"
#import "TLLineView.h"
#import "UIColor+Tridon.h"

@interface ViewController ()
{
    TLLineView  *lineView;
    UIButton    *btnDay;
    UIButton    *btnWeek;
    UIButton    *btnMonth;
    UIButton    *btnBig;
    UIButton    *btnSmall;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 日k按钮
    btnDay = [[UIButton alloc] init];
    [btnDay setTitle:@"日K" forState:UIControlStateNormal];
    [btnDay addTarget:self action:@selector(kDayLine) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonAttr:btnDay];
    [self.view addSubview:btnDay];
    @weakify(self);
    [btnDay mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self.view).offset(90);
        make.left.equalTo(self.view).offset(30);
        make.width.equalTo(@60);
        make.height.equalTo(@30);
    }];
    
    // 周k按钮
    btnWeek = [[UIButton alloc] init];
    [btnWeek setTitle:@"周K" forState:UIControlStateNormal];
    [btnWeek addTarget:self action:@selector(kWeekLine) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonAttr:btnWeek];
    [self.view addSubview:btnWeek];
    [btnWeek mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnDay);
        make.left.equalTo(btnDay.mas_right).offset(5);
        make.width.height.equalTo(btnDay);
    }];
    
    // 月k按钮
    btnMonth = [[UIButton alloc] init];
    [btnMonth setTitle:@"月K" forState:UIControlStateNormal];
    [btnMonth addTarget:self action:@selector(kMonthLine) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonAttr:btnMonth];
    [self.view addSubview:btnMonth];
    [btnMonth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnWeek);
        make.left.equalTo(btnWeek.mas_right).offset(5);
        make.width.height.equalTo(btnWeek);
    }];
    
    // 放大
    btnBig = [[UIButton alloc] init];
    [btnBig setTitle:@"+" forState:UIControlStateNormal];
    [btnBig addTarget:self action:@selector(kBigLine) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonAttr:btnBig];
    [self.view addSubview:btnBig];
    [btnBig mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnMonth);
        make.left.equalTo(btnMonth.mas_right).offset(5);
        make.width.height.equalTo(btnMonth);
    }];
    
    // 缩小
    btnSmall = [[UIButton alloc] init];
    [btnSmall setTitle:@"-" forState:UIControlStateNormal];
    [btnSmall addTarget:self action:@selector(kSmallLine) forControlEvents:UIControlEventTouchUpInside];
    [self setButtonAttr:btnSmall];
    [self.view addSubview:btnSmall];
    [btnSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnBig);
        make.left.equalTo(btnBig.mas_right).offset(5);
        make.width.height.equalTo(btnBig);
    }];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#111111" withAlpha:1];
    // 添加k线图
    lineView = [[TLLineView alloc] init];
    CGRect frame = self.view.frame;
    frame.origin = CGPointMake(0, SCREEN_HEIGHT/4.5);
    frame.size = CGSizeMake(SCREEN_WIDTH-40.0, 220);
    lineView.frame = frame;
    //lineView.backgroundColor = [UIColor blueColor];
    lineView.req_type = @"d";
//    lineView.req_freq = @"601888.SS";
//    lineView.req_freq = @"601519.SS";
//    lineView.req_freq = @"399001.SZ";
    lineView.req_freq = @"000001.SS";
    lineView.kLineWidth = 5;
    lineView.kLinePadding = 0.5;
    [self.view addSubview:lineView];
    [lineView start]; // k线图运行
    [self setButtonAttrWithClick:btnDay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}

-(void)kDayLine{
    [self setButtonAttrWithClick:btnDay];
    [self setButtonAttr:btnMonth];
    [self setButtonAttr:btnWeek];
    lineView.req_type = @"d";
    [self kUpdate];
}

-(void)kWeekLine{
    [self setButtonAttrWithClick:btnWeek];
    [self setButtonAttr:btnMonth];
    [self setButtonAttr:btnDay];
    lineView.req_type = @"w";
    [self kUpdate];
}

-(void)kMonthLine{
    [self setButtonAttrWithClick:btnMonth];
    [self setButtonAttr:btnWeek];
    [self setButtonAttr:btnDay];
    lineView.req_type = @"m";
    [self kUpdate];
}

-(void)kBigLine{
    lineView.kLineWidth += 1;
    [self kUpdate];
}

-(void)kSmallLine{
    lineView.kLineWidth -= 1;
    if (lineView.kLineWidth<=1) {
        lineView.kLineWidth = 1;
    }
    [self kUpdate];
}

-(void)kUpdate{
    [lineView update];
}

-(void)setButtonAttr:(UIButton*)button{
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
-(void)setButtonAttrWithClick:(UIButton*)button{
    button.backgroundColor = [UIColor colorWithHexString:@"cccccc" withAlpha:1];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
