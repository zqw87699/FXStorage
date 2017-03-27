//
//  FXStorageUserDefault.m
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXStorageUserDefault.h"

@interface FXStorageUserDefault ()

@property(nonatomic, weak) NSUserDefaults *userDefaults;

@end

@implementation FXStorageUserDefault

DEF_SINGLETON_INIT(FXStorageUserDefault)

-(void) singleInit {
    self.userDefaults = [NSUserDefaults standardUserDefaults];
}

#pragma mark IFXStorageProtocol
- (BOOL)hasObjectForKey:(NSString*)key {
    id value = [self.userDefaults objectForKey:key];
    return value ? YES : NO;
}

- (BOOL)boolForKey:(NSString*)key {
    if (key)
        return [self.userDefaults boolForKey:key];
    return NO;
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    if (key) {
        [self.userDefaults setBool:value forKey:key];
        [self.userDefaults synchronize];
    }
}

- (NSString*)stringForKey:(NSString*)key {
    if (key) {
        return [self.userDefaults stringForKey:key];
    }
    return nil;
}

- (void)setString:(NSString*)value forKey:(NSString*)key {
    if (value && key) {
        [self.userDefaults setObject:value forKey:key];
        [self.userDefaults synchronize];
    }
}

- (NSData*)dataForKey:(NSString*)key {
    if (key) {
        return [self.userDefaults dataForKey:key];
    }
    return nil;
}

- (void)setData:(NSData*)data forKey:(NSString*)key {
    if (data && key) {
        [self.userDefaults setObject:data forKey:key];
        [self.userDefaults synchronize];
    }
}

- (id<NSCoding>)objectForKey:(NSString*)key {
    if (key) {
        return [self.userDefaults objectForKey:key];
    }
    return nil;
}

- (void)setObject:(id<NSCoding>)object forKey:(NSString*)key {
    if (object && key) {
        [self.userDefaults setObject:object forKey:key];
        [self.userDefaults synchronize];
    }
}

- (void)removeObjectForKey:(NSString*)key {
    if (key) {
        [self.userDefaults removeObjectForKey:key];
        [self.userDefaults synchronize];
    }
}

- (void)removeAllObjects {
    [NSUserDefaults resetStandardUserDefaults];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
}

+(id<IFXStorageProtocol>)getInstance {
    return [FXStorageUserDefault sharedInstance];
}

@end
