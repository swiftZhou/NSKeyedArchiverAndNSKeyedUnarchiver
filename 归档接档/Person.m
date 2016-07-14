//
//  Person.m
//  归档接档
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - 归档时调用次方法
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_address forKey:@"address"];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_apples forKey:@"apples"];
}
#pragma mark - 解档时调用的方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.apples = [aDecoder decodeObjectForKey:@"apples"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
    }
    return self;
}
@end
