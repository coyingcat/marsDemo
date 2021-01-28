//
//  a_0.m
//  category
//
//  Created by Jz D on 2021/1/28.
//

#import <Foundation/Foundation.h>



typedef struct category_t {
    const char *name;
    classref_t cls;
    struct method_list_t *instanceMethods;
    struct method_list_t *classMethods;
    struct protocol_list_t *protocols;
    struct property_list_t *instanceProperties;
} category_t;




void _objc_init(void)
{
    static bool initialized = false;
    if (initialized) return;
    initialized = true;
   
    // fixme defer initialization until an objc-using image is found?
    environ_init();
    tls_init();
    lock_init();
    exception_init();
       
    // Register for unmap first, in case some +load unmaps something
    _dyld_register_func_for_remove_image(&unmap_image);
    
// # 1
    dyld_register_image_state_change_handler(dyld_image_state_bound,
                                             1/*batch*/, &map_images);
    dyld_register_image_state_change_handler(dyld_image_state_dependents_initialized, 0/*not batch*/, &load_images);
}



// # 2

// map_镜像
// map_images, 调用 _read_images

// _read_images 里面

// Discover categories.
    for (EACH_HEADER) {
        category_t **catlist =
            _getObjc2CategoryList(hi, &count);
        for (i = 0; i < count; i++) {
            category_t *cat = catlist[i];
            class_t *cls = remapClass(cat->cls);

            if (!cls) {
                // Category's target class is missing (probably weak-linked).
                // Disavow any knowledge of this category.
                catlist[i] = NULL;
                if (PrintConnecting) {
                    _objc_inform("CLASS: IGNORING category \?\?\?(%s) %p with "
                                 "missing weak-linked target class",
                                 cat->name, cat);
                }
                continue;
            }

            // Process this category.
            // First, register the category with its target class.
            // Then, rebuild the class's method lists (etc) if
            // the class is realized.
            BOOL classExists = NO;
            if (cat->instanceMethods ||  cat->protocols
                ||  cat->instanceProperties)
            {
                addUnattachedCategoryForClass(cat, cls, hi);
                if (isRealized(cls)) {
                    remethodizeClass(cls);
                    classExists = YES;
                }
                if (PrintConnecting) {
                    _objc_inform("CLASS: found category -%s(%s) %s",
                                 getName(cls), cat->name,
                                 classExists ? "on existing class" : "");
                }
            }

            if (cat->classMethods  ||  cat->protocols
                /* ||  cat->classProperties */)
            {
                addUnattachedCategoryForClass(cat, cls->isa, hi);
                if (isRealized(cls->isa)) {
                    remethodizeClass(cls->isa);
                }
                if (PrintConnecting) {
                    _objc_inform("CLASS: found category +%s(%s)",
                                 getName(cls), cat->name);
                }
            }
        }
    }
