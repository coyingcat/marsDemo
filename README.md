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

<hr>



dyld 是 the **dy**namic **l**ink e**d**itor 的缩写，


它是苹果的动态链接器