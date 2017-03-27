//
//  FXStorageFactory.h
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFXStorageProtocol.h"

typedef NS_ENUM(NSInteger,FXStorageType){
    /*
     *  NSUserDefault可删除
     */
    FXStorageTypeUserDefault = 0,
    
    /*
     *  持久化缓存。无法删除
     */
    FXStorageTypeKeyChain = 1,
};

@interface FXStorageFactory : NSObject

/**
 *  获取缓存对象
 */
+ (id<IFXStorageProtocol>)getStorageObject:(FXStorageType)type;

@end
