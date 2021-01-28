//
//  ViewController.m
//  666
//
//  Created by Jz D on 2021/1/28.
//

#import "SecondCtrl.h"

@interface SecondCtrl ()

@end

@implementation SecondCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    
    NSLog(@"%@", @(__PRETTY_FUNCTION__));

}



- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}




- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear: animated];
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}



- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
    
}



- (void)dealloc{
    NSLog(@"%@", @(__PRETTY_FUNCTION__));
}
@end
