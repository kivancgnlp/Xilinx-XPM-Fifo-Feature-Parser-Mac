//
//  Fifo_feature_extractor.m
//  obj_c_xilinx_fifo_parameters_parse
//
//  Created by Kivanc Gunalp on 29.01.2023.
//

#import "Fifo_feature_extractor.h"

@implementation Fifo_feature_extractor{
    
    unsigned int adv_feat_val;
    BOOL value_valid;
    
    BOOL overflow_flag;
    BOOL prog_full_flag;
    BOOL wr_data_count;
    BOOL almost_full_flag;
    BOOL wr_ack_flag;
    BOOL underflow_flag;
    BOOL prog_empty_flag;
    BOOL rd_data_count;
    BOOL almost_empty_flag;
    BOOL data_valid_flag;
    
    NSDictionary *bit_places_dictionary;
    
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self prepare_bit_places_dictionary];
        adv_feat_val = 0;
        value_valid = YES;
        [self parse_fields];
    }
    
    return self;
}

- (instancetype)initWithString:(NSString *)adv_features_str
{
    self = [super init];
    if (self) {
        [self prepare_bit_places_dictionary];
        NSScanner* scanner = [NSScanner scannerWithString:adv_features_str];
        value_valid = [scanner scanHexInt:&adv_feat_val];
        
        if (value_valid == NO) {
            NSLog(@"Parse hatasi");
            adv_feat_val = 0;
        }
        
        [self parse_fields];
    }
    return self;
}

- (void) prepare_bit_places_dictionary{
    
    bit_places_dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
        @0, @"overflow_flag", // sol taraf value, sag taraf key
        @1, @"prog_full_flag",
        @2, @"wr_data_count",
        @3, @"almost_full_flag",
        @4, @"wr_ack_flag",
        @8, @"underflow_flag",
        @9, @"prog_empty_flag",
        @10, @"rd_data_count",
        @11, @"almost_empty_flag",
        @12, @"data_valid_flag",
        nil];
    
    //NSArray *key_arr = @[@"overflow_flag",@"prog_full_flag"];
    //NSArray *value_arr = @[@0,@1];
    //bit_places_dictionary = [NSDictionary dictionaryWithObjects:value_arr forKeys:key_arr];
}

- (BOOL) reparseFromString:(NSString *)adv_features_str{
    
    NSLog(@"Reparsing string : %@",adv_features_str);
    
    NSScanner* scanner = [NSScanner scannerWithString:adv_features_str];
    value_valid = [scanner scanHexInt:&adv_feat_val];
    
    if (value_valid == NO) {
        NSLog(@"Parse hatasi");
        adv_feat_val = 0;
    }
    
    [self parse_fields];
    
    scanner = nil; // Bu gerekli mi olmayabilir ama dealloc'unu garantiliyor bence
    
    return value_valid;
    
}

- (void) parse_fields{
    

    /* Burada fieldlara atama yapilirken eger self olmaz ise KVO mekanizması çalışmıyor ( update notification gelmiyor */
    self.overflow_flag = [self get_feat_bit_value_for_name:@"overflow_flag"];
    self.prog_full_flag = [self get_feat_bit_value_for_name:@"prog_full_flag"];
    self.wr_data_count = [self get_feat_bit_value_for_name:@"wr_data_count"];
    self.almost_full_flag = [self get_feat_bit_value_for_name:@"almost_full_flag"];
    self.wr_ack_flag = [self get_feat_bit_value_for_name:@"wr_ack_flag"];
    self.underflow_flag = [self get_feat_bit_value_for_name:@"underflow_flag"];
    self.prog_empty_flag = [self get_feat_bit_value_for_name:@"prog_empty_flag"];
    self.rd_data_count = [self get_feat_bit_value_for_name:@"rd_data_count"];
    self.almost_empty_flag = [self get_feat_bit_value_for_name:@"almost_empty_flag"];
    self.data_valid_flag = [self get_feat_bit_value_for_name:@"data_valid_flag"];
        
}

- (void) printValueAsHexString{
    
    NSLog(@"feature value as hex : %x",adv_feat_val);
    
}

- (NSString *)description{
    
    if (value_valid == NO) {
        return @"Gecersiz hex value string";
    }
    
    NSMutableString *m_str = [NSMutableString string];
    
    if(overflow_flag){
        [m_str appendString:@"overflow flag, "];
    }
    
    if (prog_full_flag) {
        [m_str appendString:@"prog_full flag, "];
    }
    
    if (wr_data_count) {
        [m_str appendString:@"wr_data_count, "];
    }
    
    if(almost_full_flag){
        [m_str appendString:@"almost_full flag, "];
    }
    
    if(wr_ack_flag){
        [m_str appendString:@"wr_ack flag, "];
    }
    
    if(underflow_flag){
        [m_str appendString:@"underflow flag, "];
    }
    
    if(prog_empty_flag){
        [m_str appendString:@"prog_empty flag, "];
    }
    
    if(rd_data_count){
        [m_str appendString:@"rd_data_count, "];
    }
    
    if(almost_empty_flag){
        [m_str appendString:@"almost_empty flag, "];
    }
    
    if(data_valid_flag){
        [m_str appendString:@"data_valid flag, "];
    }
    
    
    return m_str;
}

// Accessor methodlar baslangic
- (BOOL) overflow_flag{
    return  overflow_flag;
}

- (BOOL) prog_full_flag{
    return  prog_full_flag;
}

- (BOOL) wr_data_count{
    return  wr_data_count;
}

- (BOOL) almost_full_flag{
    return  almost_full_flag;
}

- (BOOL) wr_ack_flag{
    return  wr_ack_flag;
}

- (BOOL) underflow_flag{
    return  underflow_flag;
}

- (BOOL) prog_empty_flag{
    return  prog_empty_flag;
}

- (BOOL) rd_data_count{
    return  rd_data_count;
}

- (BOOL) almost_empty_flag{
    return  almost_empty_flag;
}

- (BOOL) data_valid_flag{
    return  data_valid_flag;
}

// Accessor methodlar bitis

- (void) set_feat_bit_value_for_name:(NSString *) bit_place_name value:(BOOL) enabled{
    
    NSNumber *bit_place = bit_places_dictionary[bit_place_name];
    assert(bit_place);
    
    unsigned bit_mask = 1 << bit_place.unsignedIntValue;
    
    if(enabled){
        adv_feat_val |= bit_mask;
    }else{
        adv_feat_val &= ~bit_mask;
    }
    
    
}

- (BOOL) get_feat_bit_value_for_name:(NSString *) bit_place_name{
    
    NSNumber *bit_place = bit_places_dictionary[bit_place_name];
    assert(bit_place);
    
    unsigned bit_mask = 1 << bit_place.unsignedIntValue;
    
    if (adv_feat_val & bit_mask) {
        return YES;
    }else{
        return NO;
    }
    
    
}

- (NSString *) features_hex_string
{
    
    return [NSString stringWithFormat:@"%04X", adv_feat_val];
}

// setter methodlari
- (void) setOverflow_flag:(BOOL) enabled{
    
  [self set_feat_bit_value_for_name:@"overflow_flag" value:enabled];
  overflow_flag = enabled;
}

- (void) setProg_full_flag:(BOOL) enabled{
    
    [self set_feat_bit_value_for_name:@"prog_full_flag" value:enabled];
    prog_full_flag = enabled;
}

- (void) setWr_data_count:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"wr_data_count" value:enabled];
    wr_data_count = enabled;
}
- (void) setAlmost_full_flag:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"almost_full_flag" value:enabled];
    almost_full_flag = enabled;
}

- (void) setWr_ack_flag:(BOOL) enabled{
    
    [self set_feat_bit_value_for_name:@"wr_ack_flag" value:enabled];
    wr_ack_flag = enabled;
}

- (void) setUnderflow_flag:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"underflow_flag" value:enabled];
    underflow_flag = enabled;
}
- (void) setProg_empty_flag:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"prog_empty_flag" value:enabled];
    prog_empty_flag = enabled;
}

- (void) setRd_data_count:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"rd_data_count" value:enabled];
    rd_data_count = enabled;
}
- (void) setAlmost_empty_flag:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"almost_empty_flag" value:enabled];
    almost_empty_flag = enabled;
}
- (void) setData_valid_flag:(BOOL) enabled{
    [self set_feat_bit_value_for_name:@"data_valid_flag" value:enabled];
    data_valid_flag = enabled;
}

- (void) setFeatures_hex_string:(NSString *) hex_str
{
    [self reparseFromString:hex_str];
    
}

+ (NSSet *)keyPathsForValuesAffectingFeatures_hex_string
{
    /* Notlar : */
    /* Burda Features_hex_string property gercekten olmadigi icin ( genereated property aslında ) degistigini gostermek icin bunun neye bağlı değiştini gösteriyoruz */
    /* propery'nin neye bagli oldunugu tarif etmek için şöyle bir static fonksiyon implement etmek gerekiyor + (NSSet *) keyPathsForValuesAffecting<PropertyName> */
    return [NSSet setWithObjects:@"overflow_flag",@"prog_full_flag",@"wr_data_count",@"almost_full_flag",@"wr_ack_flag",@"underflow_flag",@"prog_empty_flag",@"rd_data_count",@"almost_empty_flag",@"data_valid_flag",nil];
}

@end
