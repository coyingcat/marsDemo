//
//  0.m
//  category
//
//  Created by Jz D on 2021/1/28.
//

#import <Foundation/Foundation.h>






@interface MyClass : NSObject

- (void)printName;

@end

@interface MyClass(MyAddition)

@property(nonatomic, copy) NSString *name;

- (void)printName;

@end



@implementation MyClass

- (void)printName
{
    NSLog(@"%@",@"MyClass");
}

@end

@implementation MyClass(MyAddition)

- (void)printName
{
    NSLog(@"%@",@"MyAddition");
}

@end
