# marsDemo
大厂 mars


<hr>


<hr>


Union Find 并查集 ( 深度优先，一路递归过去 )


Disjoint Set
不相交

不相干集合




bijection
双向单射


<hr>


<hr>


C 语言的 void * 指针，

相当于 OC 的 id

<hr>


<hr>


runloop 两：


* 等待事件处理， wait


* 通知去处理事件， observe

<hr>


<hr>

内存

* weak 表


有一个 Union


* ARC, 引用计数表



因为多指向，可以等价
哈希表，和并查集


* 关联对象表， AssociationsHashMap

<hr>


<hr>



是 dyld， 不是 lldb



### [深入理解Objective-C：Category](https://tech.meituan.com/2015/03/03/diveintocategory.html)


<hr>







<hr>



没用的环境变量


OBJC_PRINT_REPLACED_METHODS


OBJC_PRINT_LOAD_METHODS



可以在执行load方法以及加载category的时候打印log信息


<hr>


讲故事，使用数据结构，


就够了


操作代码，不是很值得提到


<hr>


面试，就是讲故事





<hr>




<hr>




<hr>


信号量 wait


signal


控制

[iOS实录16：GCD小结之控制最大并发数](https://www.jianshu.com/p/5d51a367ed62)




[OC中load方法](https://www.jianshu.com/p/a48a6aa87d39)


load 方法，调用顺序：

父类 >子类> 分类。
类和分类中的load方法都会执行
父类永远大于子类，子类永远大于分类
如果有多个分类会按照编译顺序执行，先编译先执行



<hr>

https://stackoverflow.com/questions/22809848/objective-c-runtime-run-code-at-deallocation-of-any-object/31560217#31560217



 Fun With the Objective-C Runtime: Run Code at Deallocation of Any Object




 
<hr>



dyld 是 the **dy**namic **l**ink e**d**itor 的缩写，


它是苹果的动态链接器



<hr>



循环缓冲区，


一个容量，


一个指针



<hr>



mutex 互斥锁，

相当于 Semaphore 的数目为 2


区别如图：


<hr>



C++ 异步， future


* future get result
未来，获取结果

* promise pass argv
保证，将要传参


<hr>

C++ 实现 async， 子线程做事情，不用管

开线程，完了


<hr>


C++ 实现 async， 子线程算结果，主线程打印

开线程，

有线程共享的变量，


互斥锁，mutex

条件变量, 保证代码运行的先后
conditional_variable


<hr>



锁的例子是，
厕所



<hr>


<hr>



什么时候用 auto release pool,


for 循环



<hr>


<hr>


注册到 auto release pool，


就是把对象添加到，auto release pool，内部的数组



<hr>



<hr>

6 设计原则:

* 单一职责原则(Single-Responsibility Principle)　　



* 里氏代换原则(Liskov Substitution Principle)


* 依赖倒置原则(Dependence Inversion Principle)


* 接口隔离原则(Interface Segregation Principle)


* 迪米特原则(Law of Demeter)



* 开放－封闭原则(Open-Closed Principle)