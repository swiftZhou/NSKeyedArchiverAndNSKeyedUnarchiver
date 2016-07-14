//
//  ViewController.m
//  归档接档
//
//  Created by 周海 on 16/7/14.
//  Copyright © 2016年 zhouhai. All rights reserved.
//
#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    

    //1. 写入到文件
    NSString *name = @"周大海是傻X55";
    //获取写入到的文件路径
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"name.txt"];
    
    NSData *data = [name dataUsingEncoding:NSUTF8StringEncoding];
    
    BOOL success = [data writeToFile:path atomically:YES];
    
    if (success) {
        NSLog(@"写入成功");
    } else{
        NSLog(@"写入失败");

    }

    
    //读取文件
    NSString *filedata = [NSHomeDirectory() stringByAppendingPathComponent:@"name.txt"];
//    NSData *filedata = [[NSData alloc] initWithContentsOfFile:filePath];
    //创建解归档对象，对data中的数据进行解归档
    
    NSError *error = nil;
    NSString *str = [NSString stringWithContentsOfFile:filedata encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"str ===%@",str);
    
    
    
    
    
    
    
    
    
    
    
    
    
    //====================================================================================
    NSDictionary *dic = @{@"name":@"周哈哈"};
    NSArray *arr = @[@"zhang",@"hahaa",@"3343"];
    NSMutableData *aData = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:aData];
    //编码
    [archiver encodeObject:arr forKey:@"arr"];
    [archiver encodeObject:@100 forKey:@"score"];
    [archiver encodeObject:@"周大海" forKey:@"name"];
    [archiver encodeObject:dic forKey:@"dic"];
    
    //编码完成，将上面的归档数据填充到aData中,此时aData中已经存储了归档对象的数据
    [archiver finishEncoding];
    
    NSString *aFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.src"];
    BOOL isSuccess = [aData writeToFile:aFilePath atomically:YES];
    if (isSuccess) {
        NSLog(@"归档成功");
    } else{
        NSLog(@"归档失败");
    }

    //读取归档数据
    NSData *nData = [[NSData alloc] initWithContentsOfFile:aFilePath];
    //创建接档对象，对nData中的数据进行解归档
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:nData];
    
    //解归档
    NSArray *array = [unarchiver decodeObjectForKey:@"arr"];
    NSLog(@"arrar==%@",array);
    
    id value = [unarchiver decodeObjectForKey:@"score"];
    NSLog(@"score==%@",value);
    
    NSDictionary *nDic = [unarchiver decodeObjectForKey:@"dic"];
    NSLog(@"nDic === %@",nDic);
    
    
    
    //====================================================================================
    NSLog(@"==================================自定义类的归档解档===================================");
    Person *p = [[Person alloc] init];
    p.name = @"郭宁同学";
    p.age = 20;
    p.apples = @[@"ihpone",@"ipad",@"iWatch"];
    p.address = @"天通苑";

    
    
    
    //归档
    NSString *pFilePath = [NSHomeDirectory() stringByAppendingPathComponent:@"person.zhou"];
    BOOL pSuccess = [NSKeyedArchiver archiveRootObject:p toFile:pFilePath];
    if (pSuccess) {
        NSLog(@"p对象归档成功");
    } else{
        NSLog(@"p对象归档失败");
    }
    
    //解档
    Person *person = [NSKeyedUnarchiver unarchiveObjectWithFile:pFilePath];
    NSLog(@"name:%@,age:%ld,address:%@,apples:%@",person.name,person.age,person.address,person.apples);
}


@end
