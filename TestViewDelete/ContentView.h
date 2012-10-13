//
//  ContentView.h
//  TestViewDelete
//
//  Created by Ado on 13/10/12.
//  Copyright (c) 2012 Ado. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ContentViewDelegate;

@interface ContentView : UIView


- (IBAction)deleteTapped:(id)sender;

@property(nonatomic, weak) id<ContentViewDelegate> delegate;

@end

@protocol ContentViewDelegate <NSObject>

-(void)contentViewWillDelete:(ContentView *)contentView;

@end
