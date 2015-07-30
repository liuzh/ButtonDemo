//
//  ViewController.m
//  ButtonDemo
//
//  Created by mac on 15/7/30.
//  Copyright (c) 2015年 com.liu. All rights reserved.
//

#import "ViewController.h"

@interface UIColor (HexString)
+ (UIColor *) colorWithHexString: (NSString *) hexString;
@end

@interface NSString (Text)
-(CGSize)sizeWithFont:(UIFont *)ft width:(CGFloat)w;
@end

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

@implementation NSString (Text)

-(CGSize)sizeWithFont:(UIFont *)ft width:(CGFloat)w{
    CGSize size = [self boundingRectWithSize:CGSizeMake(w, 100000)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:ft}
                                     context:nil].size;
    CGSize ceilfSize = CGSizeMake(ceilf(size.width), ceilf(size.height));
    return ceilfSize;
}
@end

@implementation UIColor (HexString)

+ (UIColor *) colorWithHexString: (NSString *) hexString
{
    if (![hexString isKindOfClass:[NSString class]] || hexString.length<1) {
        
        return nil;
    }
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            NSAssert(YES, @"Invalid color value");
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length
{
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}
@end


