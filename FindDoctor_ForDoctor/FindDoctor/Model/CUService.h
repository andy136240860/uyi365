//
//  CUService.h
//  CollegeUnion
//
//  Created by li na on 15/2/18.
//  Copyright (c) 2015年 li na. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Disease.h"
#import "CUUser.h"

@interface CUService : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;// 描述
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *serviceTime;

@property NSInteger queueNumber;
@property NSInteger queueCount;

@property (nonatomic, strong) Doctor *doctor;
@property (nonatomic, strong) CUUser *patience;
@property (nonatomic, strong) Disease *disease;

@property double dealPrice;

@end

