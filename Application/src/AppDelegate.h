//
//  AppDelegate.h
//  MacOSAPP_XilinxFifoAdvFeatures_Parser
//
//  Created by Kivanc on 1/30/23.
//  Copyright (c) 2023 kivcorp. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Fifo_feature_extractor.h"


@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (strong) Fifo_feature_extractor *ffe;

- (IBAction)parse_dugmesi_basildi:(id)sender;
@property (weak) IBOutlet NSButton *chk_overflow_flag;
@property (weak) IBOutlet NSButton *chk_prog_full_flag;
@property (weak) IBOutlet NSButton *chk_write_data_count;
@property (weak) IBOutlet NSButton *chk_almos_full_flag;
@property (weak) IBOutlet NSButton *chk_write_ack_flag;

@property (weak) IBOutlet NSButton *chk_underflow_flag;
@property (weak) IBOutlet NSButton *chk_prog_empty_flag;
@property (weak) IBOutlet NSButton *chk_read_data_count;
@property (weak) IBOutlet NSButton *chk_almost_empty_flag;
@property (weak) IBOutlet NSButton *chk_data_valid;

@property (weak) IBOutlet NSTextField *txt_hex_str;

@end
