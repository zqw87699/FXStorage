//
//  IFXStorageProtocol.h
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IFXStorageProtocol <NSObject>

/**
 *  是否存在key
 *
 *  @param key 键值
 *
 *  @return 是否存在
 */
- (BOOL)hasObjectForKey:(NSString*)key;

/**
 *  获取bool类型数据
 *
 *  @param key 键
 *
 *  @return value
 */
- (BOOL)boolForKey:(NSString*)key;

/**
 *  设置bool类型数据
 *
 *  @param value 数据
 *  @param key   键
 */
- (void)setBool:(BOOL)value forKey:(NSString*)key;

/**
 *  获取字符串data
 *
 *  @param key 键
 *
 *  @return value
 */
- (NSString*)stringForKey:(NSString*)key;

/**
 *  设置字符串类型数据
 *
 *  @param value 数据
 *  @param key   键
 */
- (void)setString:(NSString*)value forKey:(NSString*)key;

/**
 *  返回NSData数据
 *
 *  @param key 键
 *
 *  @return value
 */
- (NSData*)dataForKey:(NSString*)key;

/**
 *  设置NSData类型数据
 *
 *  @param data 数据
 *  @param key  键
 */
- (void)setData:(NSData*)data forKey:(NSString*)key;

/**
 *  获取对象值
 *
 *  @param key 键值
 *
 *  @return 对应值
 */
- (id<NSCoding>)objectForKey:(NSString*)key;

/**
 *  设置对象值
 *
 *  @param object 值（如果key 为空，表示删除key）
 *  @param key    键值
 */
- (void)setObject:(id<NSCoding>)object forKey:(NSString*)key;

/**
 *  删除key
 *
 *  @param key 键值
 */
- (void)removeObjectForKey:(NSString*)key;

/**
 *  删除所有对象值
 */
- (void)removeAllObjects;

/**
 *  得到缓存示例对象
 */
+(id<IFXStorageProtocol>)getInstance;

@end
