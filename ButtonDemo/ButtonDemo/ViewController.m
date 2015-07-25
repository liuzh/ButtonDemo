//
//  ViewController.m
//  ButtonDemo
//
//  Created by Polo on 15/7/22.
//  Copyright (c) 2015年 Polo. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+HexString.h"
#import "NSString+TSize.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   [self.arrButton enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL *stop) {
       obj.backgroundColor = [UIColor whiteColor];
       [obj setTitleColor:[UIColor colorWithHexString:@"#34c083"] forState:UIControlStateNormal];
       obj.layer.borderColor = [[UIColor colorWithHexString:@"#34c083"] CGColor];
       obj.layer.borderWidth = 1;
       obj.layer.cornerRadius = 4;
       obj.layer.masksToBounds = YES;
       obj.clipsToBounds = YES;
       
   }];
    

    //图片在左边，间距为5
    self.btn2.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    self.btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
    
    NSLog(@"titleLabel=%@,imageView=%@",self.btn3.titleLabel,self.btn3.imageView);

    
    //图片在右边，间距为5
    
    //获取文本和图片icon的大小
    NSString *text3 =  self.btn3.titleLabel.text;
    CGSize text3Size = [text3 sizeWithFont:self.btn3.titleLabel.font width:100000];
    CGSize image3Size = self.btn3.imageView.image.size;
    //根据文本和图片icon的大小，设置偏移
    //文本的位置等于图片的位置对换＋5间距(内容大小：文本原来偏移是0，0，0，0，变换位置应该是：左边＝－图片icon宽－5，右边＝图片icon宽＋5，上下不变)
    self.btn3.titleEdgeInsets = UIEdgeInsetsMake(0, -image3Size.width-5, 0, image3Size.width+5);
    //图片icon的位置等于文本的位置对换＋5间距（内容大小：图片原来偏移是0，0，0，0，变换位置应该是：左边＝文本宽＋5，右边＝－文本宽－5，上下不变）
    self.btn3.imageEdgeInsets = UIEdgeInsetsMake(0, text3Size.width+5, 0, -text3Size.width-5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
