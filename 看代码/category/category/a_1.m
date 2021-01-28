//
//  a_1.m
//  category
//
//  Created by Jz D on 2021/1/28.
//

#import <Foundation/Foundation.h>






//  addUnattachedCategoryForClass只是把类和category做一个关联映射，

//  而remethodizeClass才是真正去处理添加事宜的功臣。



static void remethodizeClass(class_t *cls)
{
    category_list *cats;
    BOOL isMeta;

    rwlock_assert_writing(&runtimeLock);

    isMeta = isMetaClass(cls);

    // Re-methodizing: check for more categories
    if ((cats = unattachedCategoriesForClass(cls))) {
        chained_property_list *newproperties;
        const protocol_list_t **newprotos;
       
        if (PrintConnecting) {
            _objc_inform("CLASS: attaching categories to class '%s' %s",
                         getName(cls), isMeta ? "(meta)" : "");
        }
       
        // Update methods, properties, protocols
       
        BOOL vtableAffected = NO;
        attachCategoryMethods(cls, cats, &vtableAffected);
       
        newproperties = buildPropertyList(NULL, cats, isMeta);
        if (newproperties) {
            newproperties->next = cls->data()->properties;
            cls->data()->properties = newproperties;
        }
       
        newprotos = buildProtocolList(cats, NULL, cls->data()->protocols);
        if (cls->data()->protocols  &&  cls->data()->protocols != newprotos) {
            _free_internal(cls->data()->protocols);
        }
        cls->data()->protocols = newprotos;
       
        _free_internal(cats);

        // Update method caches and vtables
        flushCaches(cls);
        if (vtableAffected) flushVtables(cls);
    }
}







//  对于

//  添加类的实例方法而言，又会去调用attachCategoryMethods这个方法，我们去看下attachCategoryMethods：

static void
attachCategoryMethods(class_t *cls, category_list *cats,
                      BOOL *inoutVtablesAffected)
{
    if (!cats) return;
    if (PrintReplacedMethods) printReplacements(cls, cats);

    BOOL isMeta = isMetaClass(cls);
    method_list_t **mlists = (method_list_t **)
        _malloc_internal(cats->count * sizeof(*mlists));

    // Count backwards through cats to get newest categories first
    int mcount = 0;
    int i = cats->count;
    BOOL fromBundle = NO;
    while (i--) {
        method_list_t *mlist = cat_method_list(cats->list[i].cat, isMeta);
        if (mlist) {
            mlists[mcount++] = mlist;
            fromBundle |= cats->list[i].fromBundle;
        }
    }

    attachMethodLists(cls, mlists, mcount, NO, fromBundle, inoutVtablesAffected);

    _free_internal(mlists);

}



///  attachMethodLists方法



for (uint32_t m = 0;
             (scanForCustomRR || scanForCustomAWZ)  &&  m < mlist->count;
             m++)
        {
            SEL sel = method_list_nth(mlist, m)->name;
            if (scanForCustomRR  &&  isRRSelector(sel)) {
                cls->setHasCustomRR();
                scanForCustomRR = false;
            } else if (scanForCustomAWZ  &&  isAWZSelector(sel)) {
                cls->setHasCustomAWZ();
                scanForCustomAWZ = false;
            }
        }
       
        // Fill method list array
        newLists[newCount++] = mlist;


    //  category的方法没有“完全替换掉”原来类已经有的方法
    //  加回来了

    // ...
    // Copy old methods to the method list array
    for (i = 0; i < oldCount; i++) {
        newLists[newCount++] = oldLists[i];
    }
