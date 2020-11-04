//
//  LGPerson.m
//  KCObjc
//
//  Created by Cooci on 2020/7/24.
//

#import "LGPerson.h"
#import <objc/message.h>
#import "LGStudent.h"

@implementation LGPerson
- (void)sayHello{
    NSLog(@"%s",__func__);
}

- (void)sayNB{
    NSLog(@"%s",__func__);
}
- (void)sayMaster{
    NSLog(@"%s",__func__);
}


+ (void)lgClassMethod{
    NSLog(@"%s",__func__);
}


+ (BOOL)resolveInstanceMethod:(SEL)sel{
    NSLog(@"%s - %@ 来了",__func__,NSStringFromSelector(sel));
    
//    if (sel == @selector(say666)) {
//        IMP imp           = class_getMethodImplementation(self, @selector(sayMaster));
//        Method sayMMethod = class_getInstanceMethod(self, @selector(sayMaster));
//        const char *type  = method_getTypeEncoding(sayMMethod);
//        return class_addMethod(self, sel, imp, type);
//    }
//    else if (sel == @selector(sayNB)) {
//
//        IMP imp           = class_getMethodImplementation(objc_getMetaClass("LGPerson"), @selector(lgClassMethod));
//        Method sayMMethod = class_getInstanceMethod(objc_getMetaClass("LGPerson"), @selector(lgClassMethod));
//        const char *type  = method_getTypeEncoding(sayMMethod);
//        return class_addMethod(objc_getMetaClass("LGPerson"), sel, imp, type);
//    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
 
    NSLog(@"%s - %@ 来了",__func__,NSStringFromSelector(aSelector));

    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    NSLog(@"%s - %@ 来了",__func__,NSStringFromSelector(aSelector));
//    return [super methodSignatureForSelector:aSelector];
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
//
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    NSLog(@"%s 来了",__func__);

}



//+ (BOOL)resolveClassMethod:(SEL)sel{
//    NSLog(@"%@ 来了",NSStringFromSelector(sel));
//    if (sel == @selector(sayNB)) {
//
//        IMP imp           = class_getMethodImplementation(objc_getMetaClass("LGPerson"), @selector(lgClassMethod));
//        Method sayMMethod = class_getInstanceMethod(objc_getMetaClass("LGPerson"), @selector(lgClassMethod));
//        const char *type  = method_getTypeEncoding(sayMMethod);
//        return class_addMethod(objc_getMetaClass("LGPerson"), sel, imp, type);
//    }
//    return [super resolveClassMethod:sel];
//}

// objc_msgSend 快速查找
// 慢速查找流程
// 1: 找自己methodlist
// 2: 找父类methodlist
// 3: imp : forward
// 4: 消息处理机制
// 4.1 : 动态方法决议 - 对象方法


@end
