//
//  QRViewController.m
//  LiveStyle
//
//  Created by qlh on 2017/2/27.
//  Copyright © 2017年 MZLove. All rights reserved.
//

#import "QRViewController.h"
#import "HWScanViewController.h"

@interface QRViewController ()

@property (nonatomic,strong)UIButton *saobtn;

@property (nonatomic,strong)UIButton *makebtn;

@property (nonatomic,strong)UILabel *resultLabel;


@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [UIButton easyCoder:^(UIButton *ins) {
       
        [ins setTitle:@"扫描条码或二维码" forState:UIControlStateNormal];
        [ins setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [ins addTarget:self action:@selector(discernQR) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:ins];
        
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(40);
            make.top.equalTo(self.view).offset(94);
        }];
        self.saobtn = ins;
        
    }];
    
    [UIButton easyCoder:^(UIButton *ins) {
        
        [ins setTitle:@"生成条码或二维码" forState:UIControlStateNormal];
        [ins setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:ins];
        
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(40);
            make.top.equalTo(self.saobtn.mas_bottomMargin).offset(30);

        }];
        self.makebtn = ins;        
    }];
    
    
    [UILabel easyCoder:^(UILabel *ins) {
        
        ins.text = @"";
        ins.numberOfLines = 0;
        ins.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:ins];
        
        [ins mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.view.mas_centerX);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(300);
            make.bottom.equalTo(self.view).offset(-30);
        }];
        self.resultLabel = ins;
        
    }];
    
    
}

- (void)discernQR
{
    HWScanViewController *hw = [HWScanViewController new];
    hw.sBlock = ^(NSString *result){
        self.resultLabel.text = result;
    };
    [self.navigationController pushViewController:hw animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
