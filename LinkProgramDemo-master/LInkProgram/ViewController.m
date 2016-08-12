//
//  ViewController.m
//  LInkProgram
//
//  Created by hujiele on 16/3/5.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import "ViewController.h"
#import "MyLabel.h"
#import "UILabel+exlabel.h"

#import "LSLabel.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:[MyLabel labelinitWith:^(MyLabel *la){
//        la.label_Frame(CGRectMake(100, 100, 200, 200)).lacornerradius(30).with.lastring(@"是不是感觉masnory用起来屌屌的，这是一个链式编程的简单实现，希望对你理解链式编程有所帮助~~~~",[UIColor greenColor],15.f).labackgroundcolor([UIColor redColor]);
//    }]];
    


  [LSLabel labelInitWith:^(LSLabel *label) {
      label.
      labelText(@"weqwewqeqw").
      labelSuperView(self.view);
  } withMasonryMake:^(MASConstraintMaker *make) {
      make.left.equalTo (self.view);
      make.top.equalTo(self.view);
      make.size.mas_equalTo(CGSizeMake(200, 200));
  }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
