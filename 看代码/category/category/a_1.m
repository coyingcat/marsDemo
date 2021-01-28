//
//  a_1.m
//  category
//
//  Created by Jz D on 2021/1/28.
//

#import <Foundation/Foundation.h>

//


static struct /*_method_list_t*/ {
unsigned int entsize;  // sizeof(struct _objc_method)
unsigned int method_count;
struct _objc_method method_list[1];
}

//  实例方法列表

_OBJC_$_CATEGORY_INSTANCE_METHODS_MyClass_$_MyAddition __attribute__ ((used, section ("__DATA,__objc_const"))) = {
sizeof(_objc_method),
1,
{{(struct objc_selector *)"printName", "v16@0:8", (void *)_I_MyClass_MyAddition_printName}}
};




//




static struct /*_prop_list_t*/ {
unsigned int entsize;  // sizeof(struct _prop_t)
unsigned int count_of_properties;
struct _prop_t prop_list[1];
}



//  属性列表
_OBJC_$_PROP_LIST_MyClass_$_MyAddition __attribute__ ((used, section ("__DATA,__objc_const"))) = {
sizeof(_prop_t),
1,
{{"name","T@\"NSString\",C,N"}}
};

extern "C" __declspec(dllexport) struct _class_t OBJC_CLASS_$_MyClass;





static struct _category_t _OBJC_$_CATEGORY_MyClass_$_MyAddition __attribute__ ((used, section ("__DATA,__objc_const"))) =
{
"MyClass",
0, // &OBJC_CLASS_$_MyClass,
(const struct _method_list_t *)&_OBJC_$_CATEGORY_INSTANCE_METHODS_MyClass_$_MyAddition,
0,
0,
(const struct _prop_list_t *)&_OBJC_$_PROP_LIST_MyClass_$_MyAddition,
};



static void OBJC_CATEGORY_SETUP_$_MyClass_$_MyAddition(void ) {
_OBJC_$_CATEGORY_MyClass_$_MyAddition.cls = &OBJC_CLASS_$_MyClass;
}
#pragma section(".objc_inithooks$B", long, read, write)
__declspec(allocate(".objc_inithooks$B")) static void *OBJC_CATEGORY_SETUP[] = {
(void *)&OBJC_CATEGORY_SETUP_$_MyClass_$_MyAddition,
};



// __DATA 区
static struct _class_t *L_OBJC_LABEL_CLASS_$ [1] __attribute__((used, section ("__DATA, __objc_classlist,regular,no_dead_strip")))= {
&OBJC_CLASS_$_MyClass,
};








static struct _class_t *_OBJC_LABEL_NONLAZY_CLASS_$[] = {
&OBJC_CLASS_$_MyClass,
};
static struct _category_t *L_OBJC_LABEL_CATEGORY_$ [1] __attribute__((used, section ("__DATA, __objc_catlist,regular,no_dead_strip")))= {
&_OBJC_$_CATEGORY_MyClass_$_MyAddition,
};
