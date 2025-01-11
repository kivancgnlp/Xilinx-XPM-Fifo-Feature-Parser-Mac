//
//  Fifo_feature_extractor.h
//  obj_c_xilinx_fifo_parameters_parse
//
//  Created by Kivanc Gunalp on 29.01.2023.
//

#import <Foundation/Foundation.h>



@interface Fifo_feature_extractor : NSObject

- (instancetype)initWithString:(NSString *)adv_features_str;
- (instancetype)init;

- (BOOL) reparseFromString:(NSString *)adv_features_str;

- (void) printValueAsHexString;

// Accessor methodlari
- (BOOL) overflow_flag;
- (BOOL) prog_full_flag;
- (BOOL) wr_data_count;
- (BOOL) almost_full_flag;
- (BOOL) wr_ack_flag;
- (BOOL) underflow_flag;
- (BOOL) prog_empty_flag;
- (BOOL) rd_data_count;
- (BOOL) almost_empty_flag;
- (BOOL) data_valid_flag;

- (NSString *) features_hex_string;


// setter methodlari
- (void) setOverflow_flag:(BOOL) enabled;
- (void) setProg_full_flag:(BOOL) enabled;
- (void) setWr_data_count:(BOOL) enabled;
- (void) setAlmost_full_flag:(BOOL) enabled;
- (void) setWr_ack_flag:(BOOL) enabled;
- (void) setUnderflow_flag:(BOOL) enabled;
- (void) setProg_empty_flag:(BOOL) enabled;
- (void) setRd_data_count:(BOOL) enabled;
- (void) setAlmost_empty_flag:(BOOL) enabled;
- (void) setData_valid_flag:(BOOL) enabled;

- (void) setFeatures_hex_string:(NSString *) feat_hex_string;

//@property NSString *features_hex_string;

@end

