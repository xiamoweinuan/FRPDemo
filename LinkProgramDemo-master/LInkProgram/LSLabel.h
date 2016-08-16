//
//  LSLabel.h
//  LInkProgram
//
//  Created by Stone on 16/8/12.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import <CoreText/CoreText.h>
#import <QuartzCore/QuartzCore.h>
typedef void(^MasonryMake)(MASConstraintMaker *make);

@interface LSLabel : UILabel

@property (nonatomic, copy)LSLabel* (^labelText)(NSString* text);
@property (nonatomic, copy)LSLabel* (^labelSuperView)(UIView* view);
@property (nonatomic, weak)LSLabel* with;
@property (nonatomic, copy)LSLabel* (^labelTextColor)(UIColor* color);
@property (nonatomic, copy)LSLabel* (^labelBackgroundColor)(UIColor* color);
@property (nonatomic, copy)LSLabel* (^labelFont)(CGFloat fontSize);
@property (nonatomic, copy)LSLabel* (^labelTextAlignment)(NSInteger textAlignment);


@property (nonatomic, copy)LSLabel* (^labelCommon)(NSString* text,UIColor* color,CGFloat fontSize);


+(instancetype)labelInitWith:(void (^)(LSLabel *label))initBlock withMasonryMake:(MasonryMake)masonryMake;

// 设置某段字的颜色
- (void)setColor:(UIColor *)color fromIndex:(NSInteger)location length:(NSInteger)length;

// 设置某段字的字体
- (void)setFont:(UIFont *)font fromIndex:(NSInteger)location length:(NSInteger)length;

// 设置某段字的风格
- (void)setStyle:(CTUnderlineStyle)style fromIndex:(NSInteger)location length:(NSInteger)length;
@end
