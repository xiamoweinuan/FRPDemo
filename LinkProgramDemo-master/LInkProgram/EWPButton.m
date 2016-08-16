//
//  EWPButton.m
//  LInkProgram
//
//  Created by Stone on 16/8/16.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import "EWPButton.h"

@implementation EWPButton

+(instancetype)butonInitWith:(void(^)(EWPButton* button))initBlock withMasonryMake:(MasonryMake)masonryMake{
    EWPButton* button = [EWPButton buttonWithType:UIButtonTypeCustom];
    if (initBlock) {
        initBlock(button);
    }
    if (button.superview == nil) {
         NSAssert(0, @"未设置superview");
    }
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        masonryMake(make);
    }];
    return button;
}

+(instancetype)butonInitWith:(void(^)(EWPButton* button))initBlock withButtonBlock:(ButtonBlock)buttonBlock withMasonryMake:(MasonryMake)masonryMake{
    EWPButton* button = [EWPButton butonInitWith:initBlock withMasonryMake:masonryMake];
    if (buttonBlock) {
        [button setButtonBlock:buttonBlock];
    }
    return button;
}

-(void)setButtonBlock:(ButtonBlock)buttonBlock{
    if (self.buttonBlock== nil) {
        _buttonBlock = buttonBlock;
        [self removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
}
- (void)onClick:(id) sender
{
    self.userInteractionEnabled = NO;
    [self performSelector:@selector(timerDelay) withObject:self afterDelay:1.2];
    if (_buttonBlock)
    {
        _buttonBlock(self);
    }
}
-(void)timerDelay{
    self.userInteractionEnabled = YES;
}
-(EWPButton *(^)(NSString *))buttonTitle{
    return ^EWPButton *(NSString* title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}

-(EWPButton *(^)(UIColor *))buttonTitleColor{
    return ^EWPButton *(UIColor* color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
-(EWPButton *(^)(UIColor *))buttonBackgroundColor{
    return ^EWPButton *(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}
-(EWPButton *(^)(CGFloat))buttonTitleFontSize{
    return ^EWPButton *(CGFloat fontSize){
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}
-(EWPButton *(^)(NSString *))buttonNormalImageName{
    return ^EWPButton *(NSString* imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        return self;
    };
}
-(EWPButton *(^)(NSString *))buttonSelectImageName{
    return ^EWPButton *(NSString* imageName){
        [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateSelected];
        return self;
    };
}
-(EWPButton *(^)(UIView *))buttonSuperView{
    return ^EWPButton *(UIView* view){
        [view addSubview:self];
        return self;
    };
}
-(EWPButton *)with{
    return self;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


@end
