//
//  LengthOfLongestSubstring.swift
//  LeetCodeSampleCode
//
//  Created by HM C on 2019/12/29.
//  Copyright © 2019 CHM. All rights reserved.
//

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

示例 1:

输入: "abcabcbb"
输出: 3
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
示例 2:

输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
示例 3:

输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if s.isEmpty { return 0 }
    
    var maxLength = 0
    var container = Set<Character>()
    
    for index in s.indices {
        if container.count > maxLength {
            maxLength = container.count
        }
        
        container.removeAll()
        container.insert(s[index])
        
        let second = s.index(after: index)
        for character in s[second..<s.endIndex] {
            if container.contains(character) {
                break
            } else {
                container.insert(character)
            }
        }
    }
    
    if container.count > maxLength {
        maxLength = container.count
    }
    
    return maxLength
}

func lengthOfLongestSubstring1(_ s: String) -> Int {
    var ans = 0, star = 0, end = 0
    let characters = Array(s)
    var cache = Dictionary<Character, Int>()
    let length = s.count
    
    while star < length && end < length {
        let char = characters[end] // 从前到后取出一个字符
        
        if let cacheVal = cache[char] {
            star = max(star, cacheVal) // 如果有重复的字符进来了，要更新 start
        }
        
        end += 1 // end 加 1，表示向后移动了一位字符，且没有与前面的字符发生重复
        ans = max(ans, end - star) // 更新 ans 的最大值，这个时候可能上面的 if 里面也执行了，star 也更新了，此时 end - star 是 1，也可能没有，ans 更新了最大值
        cache[char] = end // char 做 key, 对应的下标 end 做 value 存入 cache 里面
    }
    
    return ans
}

func lengthOfLongestSubstring2(_ s: String) -> Int {
    let length = s.count
    var ans = 0
    var cache = Dictionary<Character, Int>()
    let characters = Array(s)
    
    var start = 0
    for end in 0..<length {
        if let cacheVal = cache[characters[end]] {
            start = max(cacheVal, start)
        }
        
        ans = max(ans, end + 1 - start)
        cache[characters[end]] = end + 1
    }
    
    return ans
}
