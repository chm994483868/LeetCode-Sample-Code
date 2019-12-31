//
//  LongestPalindrome.swift
//  LeetCodeSampleCode
//
//  Created by CHM on 2019/12/31.
//  Copyright © 2019 CHM. All rights reserved.
//

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func longestPalindrome(_ s: String) -> String {
    if s.isEmpty || s.count <= 0 { return "" }

    var start = 0, end = 0
    for i in 0..<s.count {
        let len1 = expandAroundCenter(s, i, i)
        let len2 = expandAroundCenter(s, i, i + 1)
        let len = max(len1, len2)
        if len > end - start {
            start = i - (len - 1) / 2
            end = i + len / 2
        }
    }
    
    var temporaryString = ""
    for jj in start...end + 1 {
        let character = String(s[s.index(s.startIndex, offsetBy: jj)])
        temporaryString += character
    }
    
    return temporaryString
}

private func expandAroundCenter(_ s: String, _ left: Int, _ right: Int) -> Int {
    var L = left, R = right
    while L >= 0 && R < s.count && s[s.index(s.startIndex, offsetBy: L)] == s[s.index(s.startIndex, offsetBy: R)]  {
        L -= 1
        R += 1
    }
    
    return R - L - 1
}
