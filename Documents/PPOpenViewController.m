//
//  PPOpenViewController.m
//  Documents
//
//  Created by Evgeniy Sinitsyn on 14.09.14.
//  Copyright (c) 2014 JSC PROGNOZ. All rights reserved.
//

#import "PPOpenViewController.h"

@interface PPOpenViewController ()

@property UIDocumentInteractionController* documentInteractionController;

@end

@implementation PPOpenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)OpenFile:(id)sender{
    UIButton *button = (UIButton *)sender;
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Sample" withExtension:@"ppmobile"];
    
    if (URL) {
        // Initialize Document Interaction Controller
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:URL];
        
        // Configure Document Interaction Controller
        [self.documentInteractionController setDelegate:self];
        
        // Present Open In Menu
        [self.documentInteractionController presentOpenInMenuFromRect:[button frame] inView:self.view animated:YES];
    }
}

-(IBAction)OpenReport:(id)sender{
    NSString* UriStr = @"ppmobile://open?host=prognozplatform.prognoz.com&webApp=mobile80&mobileApp=appstore&reportId=WDI_OLAP_MOBILE&returnUrl=ppexample://";
    NSURL *url = [NSURL URLWithString:UriStr];
    [[UIApplication sharedApplication] openURL:url];
}

@end
