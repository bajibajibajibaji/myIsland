//
//  ViewController.m
//  myIsland
//
//  Created by cc on 16/8/18.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "ViewController.h"
#import "FBMyIslandViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    self.title = @"111";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    FBMyIslandViewController *myIslandVC = [[FBMyIslandViewController alloc] init];
    
    [self.navigationController pushViewController:myIslandVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
