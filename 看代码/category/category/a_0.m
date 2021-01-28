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
