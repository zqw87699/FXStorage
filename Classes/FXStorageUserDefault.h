//
//  FXStorageUserDefault.h
//  TTTT
//
//  Created by 张大宗 on 2017/3/27.
//  Copyright © 2017年 张大宗. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXCommon.h"
#import "IFXStorageProtocol.h"

@interface FXStorageUserDefault : NSObject<IFXStorageProtocol>

AS_SINGLETON(FXStorageUserDefault)

@end
