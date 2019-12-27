//
//  TwoSum.hpp
//  LeetCodeSampleCode
//
//  Created by HM C on 2019/12/27.
//  Copyright © 2019 CHM. All rights reserved.
//

#ifndef TwoSum_hpp
#define TwoSum_hpp

#include <stdio.h>
#include <vector>
#include <map>

using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        if (nums.size() <= 0) { return {}; }
        
        int i, j;
        for (i = 0; i < nums.size() - 1; i++) {
            for (j = i + 1; j < nums.size(); j++) {
                if (nums[i] + nums[j] == target) {
                    return {i, j};
                }
            }
        }
        return {};
    }
};

class Solution1 {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        if (nums.size() <= 0) { return {}; }
        map<int, int> a; // 建立 map 以元素为 key, 元素在 vector 中的下标 为 value
        for (int i = 0; i < nums.size(); i++) {
            a.insert(map<int, int>::value_type(nums[i], i));
        }
        
        for (int j = 0; j < nums.size(); j++) {
            if (a.count(target - nums[j]) > 0 && a[target - nums[j]] != j) {
                return {j, a[target - nums[j]]};
            }
        }
        
        return {};
    }
};

class Solution2 {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        if (nums.size() <= 0) { return {}; }
        map<int, int> a; // 建立 map 以元素为 key, 元素在 vector 中的下标 为 value
        for (int i = 0; i < nums.size(); i++) {
            if (a.count(target - nums[i]) > 0) {
                return {a[target - nums[i]], i};
            }
            
            a[nums[i]] = i;
        }
        
        return {};
    }
};

class Solution3 {
public:
    vector<int> twoSum(vector<int> & nums, int target) {
        map<int, int> a; // 原数组里面各元素作 key, 对应的下标作 value
        vector<int> b(2, -1); // 存放结果
        for (int i = 0; i < nums.size(); i++) {
            if (a.count(target - nums[i]) > 0) {
                b[0] = a[target - nums[i]];
                b[1] = i;
                
                break;
            }
            a[nums[i]] = i;
        }
        return b;
    };
};

#endif /* TwoSum_hpp */
