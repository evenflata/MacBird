//
//  AppDelegate.m
//  MacBird
//
//  Created by EvenDev on 31/05/2019.
//  Copyright © 2019 EvenDev. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, retain) NSStatusItem *statusItem;
@property(strong, nonatomic) NSWindowController *windowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

-(void)awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusImage = [NSImage imageNamed:@"StatusImage"];
    statusHighlightImage = [NSImage imageNamed:@"StatusImage"];
    
    [statusItem setImage:statusImage];
    [statusItem setAlternateImage:statusHighlightImage];
    [statusItem setToolTip:@"Open MacBird"];
    [statusItem setHighlightMode:YES];
    [statusItem setTarget:self];
    [statusItem setAction:@selector(openMacBird:)];
}

-(void)openMacBird:(id)sender {
    NSWindow *window = [self.windowController window];
    [window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
