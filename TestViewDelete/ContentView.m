//
//  ContentView.m
//  TestViewDelete
//
//  Created by Ado on 13/10/12.
//  Copyright (c) 2012 Ado. All rights reserved.
//

#import "ContentView.h"



@implementation ContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)deleteTapped:(id)sender {
    [_delegate contentViewWillDelete:self];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0f;
        CGAffineTransform rotate = CGAffineTransformRotate(self.transform, 1);
        CGAffineTransform translate = CGAffineTransformTranslate(self.transform, 300, -100);
        self.transform = CGAffineTransformConcat(rotate, translate);
        
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
    
}
@end

