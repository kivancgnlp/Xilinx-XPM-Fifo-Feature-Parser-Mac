//
//  AppDelegate.m
//  MacOSAPP_XilinxFifoAdvFeatures_Parser
//
//  Created by Kivanc on 1/30/23.
//  Copyright (c) 2023 kivcorp. All rights reserved.
//

#import "AppDelegate.h"
#import "Fifo_feature_extractor.h"

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
      NSLog(@"applicationDidFinishLaunching geldi : ");
    
}


- (void)applicationWillFinishLaunching:(NSNotification *)aNotification{
    
    NSLog(@"applicationWillFinishLaunching geldi : ");
    
    //self.ffe = [[Fifo_feature_extractor alloc] initWithString:@"707"];
    self.ffe = [Fifo_feature_extractor new];
    
}



- (void)applicationWillTerminate:(NSNotification *)notification{
    
     NSLog(@"applicationWillTerminate geldi : ");
    
    self.ffe = Nil;
    
    
}

- (IBAction)parse_dugmesi_basildi:(id)sender {
    
    
    
    NSLog(@"Parse basildi : ");
    /*
    NSString *str = self.txt_hex_str.stringValue;
    
    [self.ffe reparseFromString:str];
    
    
    self.chk_almos_full_flag.state = self.ffe.almost_full_flag;
    self.chk_almost_empty_flag.state = self.ffe.almost_empty_flag;
    self.chk_data_valid.state = self.ffe.data_valid_flag;
    
    self.chk_overflow_flag.state = self.ffe.overflow_flag;
    self.chk_prog_empty_flag.state = self.ffe.prog_empty_flag;
    self.chk_prog_full_flag.state = self.ffe.prog_full_flag;
    
    self.chk_read_data_count.state = self.ffe.rd_data_count;
    self.chk_underflow_flag.state = self.ffe.underflow_flag;
    
    self.chk_write_ack_flag.state = self.ffe.wr_ack_flag;
    self.chk_write_data_count.state = self.ffe.wr_data_count;
    */
    
}
@end
