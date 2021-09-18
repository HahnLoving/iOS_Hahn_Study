//
//  rootViewController.m
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import "rootViewController.h"
#import "LinkViewController.h"
#import "LinkModel.h"

@interface rootViewController ()

@end

@implementation rootViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Scheme" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"Universal" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Scheme:) name:@"Scheme" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Universal:) name:@"Universal" object:nil];
}

- (void)Scheme:(NSNotification *)noti {
    LinkModel *model = [LinkModel new];
    model = noti.object;
    LinkViewController *vc = [LinkViewController new];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)Universal:(NSNotification *)noti {
    LinkModel *model = [LinkModel new];
    model = noti.object;
    LinkViewController *vc = [LinkViewController new];
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}



@end
