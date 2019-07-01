#import "WATCHTOOLSRootViewController.h"
#import <UIKit/UIKit.h>

#import "NSTask.h"

#include <spawn.h>
#include <signal.h>

@interface WATCHTOOLSRootViewController ()
@end

@implementation WATCHTOOLSRootViewController

- (void)viewDidLoad {
	[super loadView];
	UIView *redView = [[UIView alloc] init]; 
	redView.bounds = self.view.bounds; 
	redView.frame = CGRectMake(0, 0, 1000, 1000); 
	redView.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
	[self.view addSubview:redView];


	UIButton *button =  [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	[button addTarget:self action:@selector(respring:) forControlEvents:UIControlEventTouchUpInside];
	[button setTitle:@"Show View" forState:UIControlStateNormal];
	button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	button.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:button];

}

- (void)respring:(UIButton*)sender {
        NSTask *task = [[NSTask alloc] init];
        [task setLaunchPath:@"/usr/bin/killall"];
        [task setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
        [task launch];
        [task waitUntilExit];


}

@end
