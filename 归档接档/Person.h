//
//  Person.h
//  归档接档
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong)NSArray *apples;
@end
