//
//  LinkViewController.m
//  studyOC
//
//  Created by Hahn on 2021/9/15.
//

#import "LinkViewController.h"
#import "LinkModel.h"

@interface LinkViewController ()

@end

@implementation LinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)setModel:(LinkModel *)model
{
    
    UILabel *url = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 250, 80)];
    [self.view addSubview:url];
    
    UILabel *para = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 250, 500)];
    [self.view addSubview:para];
    
    url.text = model.url;
    para.text = model.para.description;
    para.numberOfLines = 0;
}

@end
