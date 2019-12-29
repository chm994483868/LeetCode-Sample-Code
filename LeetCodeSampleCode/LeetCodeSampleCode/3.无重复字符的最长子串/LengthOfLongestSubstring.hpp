//
//  LengthOfLongestSubstring.hpp
//  LeetCodeSampleCode
//
//  Created by HM C on 2019/12/29.
//  Copyright © 2019 CHM. All rights reserved.
//

#ifndef LengthOfLongestSubstring_hpp
#define LengthOfLongestSubstring_hpp

#include <stdio.h>
#include "string"

using namespace std;

class Solution {
public:
    unsigned long lengthOfLongestSubstring(string s) {
        unsigned long length = s.length();
        
        // 字符串长度为 0、1 时直接返回数字，双指针没有地方指。
        if (!length) {
            return 0;
        }
        
        if (length == 1) {
            return 1;
        }
        
        // 头指针 p，最大长度 mlen 至少为 1。
        unsigned long p = 0;
        unsigned long mlen = 1;
        // 尾指针 end
        for (unsigned long end = 1; end < length; end++) {
            
            for (unsigned long aim = p; aim < end; aim++) {
                // 情况 1
                if (s[aim] == s[end]) {
                    // 更新头指针 p
                    p = aim + 1;
                    // 更新最大长度 mlen
                    if (mlen < (end - aim)) {
                        mlen = end - aim;
                    }
                    break;
                }
            }
            
            // 情况 2
            if (mlen < end - p + 1) {
                mlen = end - p + 1;
            }
        }
        
        return mlen;
    }
};

#endif /* LengthOfLongestSubstring_hpp */
