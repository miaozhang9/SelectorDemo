//
//  NSString+Addtion.h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Addtion)

// 格式化千分位数字：如32115900 ==> 32,115,900
+ (NSString *)pc_formatThousandsStringWithString:(NSString *)doubleStr;
+ (NSString *)pc_formatThousandsStringWithString:(NSString *)string decimal:(int)decimal;
+ (NSString *)pc_formatThousandsMoneyString:(NSString *)string;

// 获取字符串的长度
- (CGSize)pc_sizeForStringWithSize:(CGSize)size fontSize:(CGFloat)font;

+ (NSArray *)charArrayFromString:(NSString *)str;
- (NSString *)pc_stringByURLDecode;
- (NSString *)pc_stringByTrim;
-(NSData *)dataFromHexString ;
+(NSData*)hexStringToByte:(NSString*)hexString;
+ (NSString *)dataToBase64:(NSData *)data;
+ (NSData *)base64ToData:(NSString *)str;
@end
