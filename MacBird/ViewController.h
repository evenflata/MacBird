//
//  ViewController.h
//  MacBird
//
//  Created by EvenDev on 31/05/2019.
//  Copyright © 2019 EvenDev. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface ViewController : NSViewController <WKNavigationDelegate, WKUIDelegate>

@property (strong) IBOutlet WKWebView *webView;
@property (strong) IBOutlet NSProgressIndicator *progressBar;

@end
