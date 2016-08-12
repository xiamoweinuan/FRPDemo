//
//  LSLabel.h
//  LInkProgram
//
//  Created by Stone on 16/8/12.
//  Copyright © 2016年 JLHuu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
typedef void(^MasonryMake)(MASConstraintMaker *make);

@interface LSLabel : UILabel

@property (nonatomic, copy)LSLabel* (^labelText)(NSString* string);
@property (nonatomic, copy)LSLabel* (^labelSuperView)(UIView* view);


+(instancetype)labelInitWith:(void (^)(LSLabel *label))initBlock withMasonryMake:(MasonryMake)masonryMake;


@end
