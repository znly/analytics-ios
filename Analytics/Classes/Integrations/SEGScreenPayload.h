#import <Foundation/Foundation.h>
#import "SEGPayload.h"

NS_ASSUME_NONNULL_BEGIN

@interface SEGScreenPayloadBuilder : SEGPayloadBuilder

@property (nonatomic, copy, nullable) NSString *name;

@property (nonatomic, copy, nullable) JSON_DICT properties;

- (instancetype)init;

@end

@interface SEGScreenPayload : SEGPayload

@property (nonatomic, readonly) NSString *name;

@property (nonatomic, readonly, nullable) NSString *category;

@property (nonatomic, readonly, nullable) JSON_DICT properties;

- (instancetype)initWithName:(NSString *)name
                  properties:(NSDictionary * _Nullable)properties
                     context:(NSDictionary *)context
                integrations:(NSDictionary *)integrations;

- (instancetype)initWithBuilder:(SEGScreenPayloadBuilder *)builder;

@end

NS_ASSUME_NONNULL_END
