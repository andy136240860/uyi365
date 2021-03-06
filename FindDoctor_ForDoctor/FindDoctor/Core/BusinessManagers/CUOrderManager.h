//
//  CUOrderManager.h
//  CollegeUnion
//
//  Created by li na on 15/2/18.
//  Copyright (c) 2015年 li na. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNBusinessMananger.h"
#import "SNServerAPIDefine.h"
#import "CUUser.h"
#import "CUOrder.h"

@interface CUOrderManager : SNBusinessMananger

SINGLETON_DECLARE(CUOrderManager);

@end

@interface CUOrderManager (Network)

// 提交订单
- (void)submitOrder:(CUService *)service user:(CUUser *)user resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

// 更新订单状态
- (void)updateOrder:(CUOrder *)order status:(OrderStatus)status user:(CUUser *)user resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

// 取消订单
- (void)cancelOrder:(CUOrder *)order user:(CUUser *)user resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

// 获取订单列表
- (void)getOrderListWithPageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize user:(CUUser *)user searchedWithOrderStatus:(OrderStatus)orderStatus resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

// 获取待评价订单列表
- (void)getUncommentOrderListWithPageNum:(NSInteger)pageNum pageSize:(NSInteger)pageSize user:(CUUser *)user searchedWithOrderStatus:(OrderStatus)orderStatus resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

// 获取订单详情
- (void)getOrderDetailWithOrderId:(NSString *)orderId user:(CUUser *)user resultBlock:(SNServerAPIResultBlock)resultBlock pageName:(NSString *)pageName;

@end