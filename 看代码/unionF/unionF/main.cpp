//
//  main.cpp
//  unionF
//
//  Created by Jz D on 2021/1/28.
//

#include <iostream>

#include <vector>

using namespace std;


class DisjSet
{
// private:
public:
    std::vector<int> parent;

public:
    DisjSet(int max_size) : parent(std::vector<int>(max_size))
    {
        // 初始化每一个元素的根节点都为自身
        for (int i = 0; i < max_size; ++i)
            parent[i] = i;
    }
    int find(int x)
    {
        return parent[x] == x ? x : find(parent[x]);
        
        //  这个是为了减少跳动次数
        //  parent[x] == find(parent[x]);
    }
    
    
    
    // 每次修改的是，root 值，也就是根的值
    
    // 根的值，也就是要查询到的值
    void to_union(int x1, int x2)
    {
        parent[find(x1)] = find(x2);
    }
    // 判断两个元素是否属于同一个集合
    bool is_same(int e1, int e2)
    {
        return find(e1) == find(e2);
    }
};





int main(int argc, const char * argv[]) {
    // insert code here...
    DisjSet one = DisjSet(5);
  //  one.to_union(2, 3);
   // one.to_union(1, 2);
    for (int i = 0; i < one.parent.size(); i++) {
        cout << one.parent[i] << endl;
        
    }
   
    
    
    return 0;
}
