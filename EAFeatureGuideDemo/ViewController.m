//
//  ViewController.m
//  EAFeatureGuide
//
//  Created by talkweb on 4/27/16.
//  Copyright © 2016 EAH. All rights reserved.
//

#import "ViewController.h"
#import "UIView+EAFeatureGuideView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *upMidView;
@property (weak, nonatomic) IBOutlet UIView *upRightView;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *leftBottomView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *rightBottomView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showFeatureGuideView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"viewDidLayoutSubviews");
}


- (void)showFeatureGuideView
{
    
    EAFeatureItem *item = [[EAFeatureItem alloc] initWithFocusView:self.button focusCornerRadius:10 focusInsets:UIEdgeInsetsMake(-10, -10, 10, 10)];
    item.introduce = @"左上方的提示";
    EAFeatureItem *item2 = [[EAFeatureItem alloc] initWithFocusView:self.upMidView focusCornerRadius:10 focusInsets:UIEdgeInsetsZero];
    item2.introduce = @"上方居中的提示";
    item2.action = ^(id sender){
        
        NSLog(@"touched ..");
        
    };
    
    EAFeatureItem *item3 = [[EAFeatureItem alloc] initWithFocusView:self.upRightView focusCornerRadius:self.upRightView.bounds.size.width / 2 + 10 focusInsets:UIEdgeInsetsMake(-10, -10, 10, 10)];
    item3.introduce = @"右上方提示";//@"txt_feature_post_activity_4.1.png";
    
    EAFeatureItem *item4 = [[EAFeatureItem alloc] initWithFocusView:self.bottomView focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
    item4.introduce = @"垂直下方提示";//@"txt_feature_post_activity_4.1.png";
    
    EAFeatureItem *item5 = [[EAFeatureItem alloc] initWithFocusView:self.leftBottomView focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
    item5.introduce = @"左下方";//@"txt_feature_post_activity_4.1.png";
    //    item5.action = ^(id sender){
    //        NSLog(@"touched ..");
    //    };
    
    EAFeatureItem *item6 = [[EAFeatureItem alloc] initWithFocusView:self.rightBottomView focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
    item6.introduce = @"右下方提示";
    item6.action = ^(id sender){
        NSLog(@"touched ..");
    };
    
    EAFeatureItem *item7 = [[EAFeatureItem alloc] initWithFocusView:self.rightView focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
    item7.introduce = @"txt_feature_post_activity_4.1.png";
    item7.action = ^(id sender){
        NSLog(@"touched ..");
    };

    EAFeatureItem *item8 = [[EAFeatureItem alloc] initWithFocusRect:self.leftView.frame focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
//    EAFeatureItem *item8 = [[EAFeatureItem alloc] initWithFocusView:self.leftView focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
    item8.introduce = @"txt_feature_post_activity_4.1.png";
    
    [self.navigationController.view showWithFeatureItems:@[item, item2,item3,item4,item5,item6, item8] saveKeyName:@"button" inVersion:nil];
}

- (void)dealloc {

}

@end
