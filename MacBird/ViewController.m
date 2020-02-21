//
//  ViewController.m
//  MacBird
//
//  Created by EvenDev on 31/05/2019.
//  Copyright © 2019 EvenDev. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface WKPreferences ()
-(void)_setFullScreenEnabled:(BOOL)fullScreenEnabled;
@end

@implementation VCWindowController

-(BOOL)windowShouldClose:(NSWindow *)sender {
    [NSApp hide:nil];
    return NO;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.navigationDelegate = self;
    _webView.UIDelegate = self;
    [self.webView.configuration.preferences _setFullScreenEnabled:YES];
    NSURL *nsurl=[NSURL URLWithString:@"https://mobile.twitter.com/login"];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    [_webView loadRequest:nsrequest];
    
    [self.webView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.webView) {
        self.progressBar.doubleValue = self.webView.estimatedProgress * 100;
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.progressBar.hidden = YES;
    self.blueView.hidden = YES;
}

-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    self.progressBar.hidden = NO;
}

-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if(!([[navigationAction.request.URL host] isEqual:@"mobile.twitter.com"])) {
        [[NSWorkspace sharedWorkspace] openURL:navigationAction.request.URL];
    }
    decisionHandler(YES);
}

- (void)dealloc {
    
    if ([self isViewLoaded]) {
        [self.webView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
    }
    
    // if you have set either WKWebView delegate also set these to nil here
    [self.webView setNavigationDelegate:nil];
    [self.webView setUIDelegate:nil];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end
