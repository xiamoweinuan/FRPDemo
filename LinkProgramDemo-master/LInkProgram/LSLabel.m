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
-(LSLabel *)with{
    return self;
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

-(LSLabel *(^)(CGFloat))labelFont{
    return ^LSLabel *(CGFloat fontSize){
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

-(LSLabel *(^)(UIColor *))labelTextColor{
    return ^LSLabel *(UIColor* color){
        self.textColor = color;
        return self;
    };
}

-(LSLabel *(^)(UIColor *))labelBackgroundColor{
    return ^ LSLabel *(UIColor* color){
        self.backgroundColor = color;
        return self;
    };
}

- (LSLabel *(^)(NSInteger))labelTextAlignment{
    return ^LSLabel *(NSInteger textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}


-(LSLabel *(^)(NSString *, UIColor *, CGFloat))labelCommon{
    return^ LSLabel*(NSString* text,UIColor* color,CGFloat fontSize){
        self.text = text;
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}



// 设置某段字的颜色
- (void)setColor:(UIColor *)color fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:self.text];
    
    
    [string addAttribute:(NSString *)kCTForegroundColorAttributeName
                       value:(id)color.CGColor
                       range:NSMakeRange(location, length)];
}

// 设置某段字的字体
- (void)setFont:(UIFont *)font fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
        NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:self.text];
    [string addAttribute:(NSString *)kCTFontAttributeName
                       value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)font.fontName,
                                                                        font.pointSize*2,
                                                                        NULL))
                       range:NSMakeRange(location, length)];
}

// 设置某段字的风格
- (void)setStyle:(CTUnderlineStyle)style fromIndex:(NSInteger)location length:(NSInteger)length{
    if (location < 0||location>self.text.length-1||length+location>self.text.length) {
        return;
    }
    
    NSMutableAttributedString* string = [[NSMutableAttributedString alloc]initWithString:self.text];
    [string addAttribute:(NSString *)kCTUnderlineStyleAttributeName
                       value:(id)[NSNumber numberWithInt:style]
                       range:NSMakeRange(location, length)];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
