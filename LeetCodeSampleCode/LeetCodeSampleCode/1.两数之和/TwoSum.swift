//
//  TwoSum.swift
//  LeetCodeSampleCode
//
//  Created by CHM on 2019/12/26.
//  Copyright © 2019 CHM. All rights reserved.
//

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。

示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/two-sum
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    if nums.isEmpty { return [] }
    
    var map = [Int: Int]()
    for index in 0..<nums.count {
        
        let difference = target - nums[index]
        if let differenceIndex = map[difference] {
            return [differenceIndex, index]
        }
        
        map[nums[index]] = index
    }
    
    return []


func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    for index in 0..<nums.count {
        for otherIndex in (index + 1)..<nums.count {
            if nums[index] + nums[otherIndex] == target {
                return [index, otherIndex]
            }
        }
    }
    
    return []
}
