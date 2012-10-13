//
//  ViewController.m
//  TestViewDelete
//
//  Created by Ado on 13/10/12.
//  Copyright (c) 2012 Ado. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    NSMutableArray *_views;
    CGFloat _initialOffset;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    
    _views = [NSMutableArray array];
    [super viewDidLoad];
    _initialOffset = 10;
    CGFloat offset = _initialOffset;
    for(int i=0; i < 5; i++){
        ContentView *contentView  = [[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:nil options:nil] objectAtIndex:0];
        contentView.delegate = self;
        contentView.tag = i;
        contentView.frame = CGRectMake(10, offset, contentView.frame.size.width, contentView.frame.size.height);
        [self.view addSubview:contentView];
        [_views addObject:contentView];
        offset += contentView.frame.size.height + _initialOffset;
    }
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ContentView delegate methods

-(void)contentViewWillDelete:(ContentView *)contentView{
    
    NSArray *afterViews = [self findAfterViewsAfter:contentView];
    [self translateUp:afterViews];
    
    
}

-(NSArray *)findAfterViewsAfter:(ContentView *)contentView{
    int viewIndex = contentView.tag;
    
    NSMutableArray *afterViews = [NSMutableArray array];
    BOOL isBefore = YES;
    for(int i=0; i < _views.count; i++){
        ContentView *currentView = [_views objectAtIndex:i];
        if(currentView.tag == viewIndex){
            isBefore = NO;
            continue;
        }
        if(!isBefore)
            [afterViews addObject:currentView];
    }
    return afterViews;
}

-(void)translateUp:(NSArray *)views{
    [UIView animateWithDuration:0.5 animations:^{
        for(ContentView *contentView in views){
            contentView.transform = CGAffineTransformTranslate(contentView.transform, 0, -contentView.frame.size.height -_initialOffset);
        }
    }];
    
}



@end
