//
//  FXStorageFactory.m
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import "FXStorageFactory.h"
#import "FXStorageKeyChain.h"
#import "FXStorageUserDefault.h"

@implementation FXStorageFactory

+ (id<IFXStorageProtocol>)getStorageObject:(FXStorageType)type{
    switch (type) {
        case FXStorageTypeKeyChain:
            return [FXStorageKeyChain getInstance];
            break;
        case FXStorageTypeUserDefault:
            return [FXStorageUserDefault getInstance];
            break;
        default:
            break;
    }
    return nil;
}

@end
