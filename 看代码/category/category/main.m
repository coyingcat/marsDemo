//
//  main.m
//  category
//
//  Created by Jz D on 2021/1/28.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

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


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        
        Class currentClass = [MyClass class];
        MyClass *my = [[MyClass alloc] init];
        [my printName];
        if (currentClass) {
            unsigned int methodCount;
            Method *methodList = class_copyMethodList(currentClass, &methodCount);
            IMP lastImp = NULL;
            SEL lastSel = NULL;
            for (NSInteger i = 0; i < methodCount; i++) {
                Method method = methodList[i];
                NSString *methodName = [NSString stringWithCString:sel_getName(method_getName(method))
                                                encoding:NSUTF8StringEncoding];
                if ([@"printName" isEqualToString:methodName]) {
                    lastImp = method_getImplementation(method);
                    lastSel = method_getName(method);
                }
            }
            typedef void (*fn)(id,SEL);
            // IMP -> block
            if (lastImp != NULL) {
                fn f = (fn)lastImp;
                f(my,lastSel);
            }
            free(methodList);
        }   
    }
    return 0;
}
