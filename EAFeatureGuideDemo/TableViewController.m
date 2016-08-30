//
//  TableViewController.m
//  EAFeatureGuide
//
//  Created by talkweb on 4/29/16.
//  Copyright © 2016 EAH. All rights reserved.
//

#import "TableViewController.h"
#import "UIView+EAFeatureGuideView.h"

@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *exampleCell;

@end

@implementation TableViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self showGuideView];
}

- (void)showGuideView
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        EAFeatureItem *item = [[EAFeatureItem alloc] initWithFocusView:self.exampleCell focusCornerRadius:0 focusInsets:UIEdgeInsetsZero];
        item.introduce = @"txt_feature_post_activity_4.1.png";
        item.actionTitle = @"太好了";
        
        CGPoint center = self.navigationController.navigationBar.center;
        CGRect rect = CGRectMake(self.navigationController.navigationBar.bounds.size.width - 48, center.y - 23, 46, 46);
        EAFeatureItem *title = [[EAFeatureItem alloc] initWithFocusRect:rect focusCornerRadius:23 focusInsets:UIEdgeInsetsZero];
        title.introduce = @"txt_feature_post_activity_4.1.png";
        title.actionTitle = @"我知道了";
        
        CGSize tabbarSize = self.tabBarController.tabBar.bounds.size;
        CGFloat centerX =  (CGFloat)(tabbarSize.width * (1.f - 1.f / (CGFloat)(self.tabBarController.tabBar.items.count * 2)));
        CGFloat centerY =  self.tabBarController.view.bounds.size.height - tabbarSize.height / 2;
        
        EAFeatureItem *recents = [[EAFeatureItem alloc] initWithFocusRect:CGRectMake(centerX - 25, centerY - 25, 50, 50) focusCornerRadius:25 focusInsets:UIEdgeInsetsZero];
        
        recents.introduce = @"recents";
        
        [self.view showWithFeatureItems:@[item,recents,title] saveKeyName:@"cell11" inVersion:@"1.0.0"];
    });
    
}


@end
