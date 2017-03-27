//
//  FXStorageKeyChain.m
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXStorageKeyChain.h"
#import "UICKeyChainStore.h"
#import "FXLogMacros.h"

@interface FXStorageKeyChain ()

@property (nonatomic, strong) UICKeyChainStore *keychainStore;

@end

@implementation FXStorageKeyChain

DEF_SINGLETON_INIT(FXStorageKeyChain)

-(void) singleInit {
    self.keychainStore = [[UICKeyChainStore alloc] initWithService:[[NSBundle mainBundle] bundleIdentifier] accessGroup:@""];
}

#pragma mark IFXStorageProtocol
- (BOOL)hasObjectForKey:(NSString*)key {
    if (key) return [self.keychainStore contains:key];
    return NO;
}

- (BOOL)boolForKey:(NSString*)key {
    NSString *value = [self.keychainStore stringForKey:key];
    if ([value length] == 1) {
        return [value boolValue];
    }
    return NO;
}

- (void)setBool:(BOOL)value forKey:(NSString*)key {
    if (key) {
        [self setString:[NSString stringWithFormat:@"%@",@(value)] forKey:key];
    }
}

- (NSString*)stringForKey:(NSString*)key {
    if (key) {
        return [self.keychainStore stringForKey:key];
    }
    return nil;
}

- (void)setString:(NSString*)value forKey:(NSString*)key {
    if (value && key) {
        [self.keychainStore setString:value forKey:key];
    }
}

- (NSData*)dataForKey:(NSString*)key {
    if (key) {
        return [self.keychainStore dataForKey:key];
    }
    return nil;
}

- (void)setData:(NSData*)data forKey:(NSString*)key {
    if (data && key) {
        [self.keychainStore setData:data forKey:key];
    }
}

- (id<NSCoding>)objectForKey:(NSString*)key {
    NSData *data = [self dataForKey:key];
    if (data && [data length] > 0 ) {
        id result = nil;
        @try {
            result = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        @catch (NSException *exception) {
            result = nil;
            FXLogError(@"异常:%@",exception);
        }
        return result;
    }
    return nil;
}

- (void)setObject:(id<NSCoding>)object forKey:(NSString*)key {
    if (object && key) {
        NSData *data = nil;
        @try {
            data = [NSKeyedArchiver archivedDataWithRootObject:object];
        }
        @catch (NSException *exception) {
            data = nil;
            FXLogError(@"异常:%@",exception);
        }
        [self setData:data forKey:key];
    }
}

- (void)removeObjectForKey:(NSString*)key {
    [self.keychainStore removeItemForKey:key];
}

- (void)removeAllObjects {
    [self.keychainStore removeAllItems];
}

+(id<IFXStorageProtocol>)getInstance {
    return [FXStorageKeyChain sharedInstance];
}

@end
