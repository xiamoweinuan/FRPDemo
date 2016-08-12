//
//  LSLabel.m
//  LInkProgram
//
//  Created by Stone on 16/8/12.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import "LSLabel.h"

@implementation LSLabel

+(instancetype)labelInitWith:(void (^)(LSLabel *label))initBlock withMasonryMake:(MasonryMake)masonryMake{
    LSLabel* label = [[LSLabel alloc]init];

    if (initBlock) {
        initBlock(label);
    }


    if (label.superview == nil) {
        NSAssert(0, @"未设置superview");
    }
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        masonryMake(make);
    }];
    return label;
}



-(LSLabel *(^)(UIView *))labelSuperView{
    return ^LSLabel *(UIView* view){
        [view addSubview:self];
        
        return self;
    };
}


-(LSLabel *(^)(NSString *))labelText{
    return ^LSLabel *(NSString* text){
        self.text  = text;
    
        return self;
    };
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
