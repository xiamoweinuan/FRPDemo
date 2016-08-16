//
//  EWPButton.h
//  LInkProgram
//
//  Created by Stone on 16/8/16.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

typedef void(^MasonryMake)(MASConstraintMaker *make);
typedef void(^ButtonBlock)(id sender);
@interface EWPButton : UIButton

@property (nonatomic, copy)EWPButton *(^buttonTitle)(NSString* title);
@property (nonatomic, copy)EWPButton *(^buttonTitleColor)(UIColor* color);
@property (nonatomic, copy)EWPButton *(^buttonTitleFontSize)(CGFloat fontSize);
@property (nonatomic, copy)EWPButton *(^buttonBackgroundColor)(UIColor* color);
@property (nonatomic, copy)EWPButton *(^buttonNormalImageName)(NSString* imageName);
@property (nonatomic, copy)EWPButton *(^buttonSelectImageName)(NSString* imageName);
@property (nonatomic, copy)EWPButton *(^buttonSuperView)(UIView* view);
@property (nonatomic, copy)EWPButton *with;

@property(nonatomic, copy)ButtonBlock  buttonBlock;


+(instancetype)butonInitWith:(void(^)(EWPButton* button))initBlock withMasonryMake:(MasonryMake)masonryMake;
+(instancetype)butonInitWith:(void(^)(EWPButton* button))initBlock withButtonBlock:(ButtonBlock)buttonBlock withMasonryMake:(MasonryMake)masonryMake;
@end
