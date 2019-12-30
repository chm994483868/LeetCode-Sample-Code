//
//  FindMedianSortedArrays.swift
//  LeetCodeSampleCode
//
//  Created by CHM on 2019/12/30.
//  Copyright © 2019 CHM. All rights reserved.
//

/*
 给定两个大小为 m 和 n 的有序数组 nums1 和 nums2。

 请你找出这两个有序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

 你可以假设 nums1 和 nums2 不会同时为空。

 示例 1:

 nums1 = [1, 3]
 nums2 = [2]

 则中位数是 2.0
 示例 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 则中位数是 (2 + 3)/2 = 2.5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var m = nums1.count
    var n = nums2.count
    
    var temporaryNums1 = nums1
    var temporaryNums2 = nums2
    
    if m > n { // to ensure m <= n
        let temporaryArray = temporaryNums1
        temporaryNums1 = temporaryNums2
        temporaryNums2 = temporaryArray
        
        let temporaryInt = m
        m = n
        n = temporaryInt
    }
    
    var iMin = 0, iMax = m, halfLen = (m + n + 1) / 2
    while iMin <= iMax {
        let i = (iMin + iMax) / 2
        let j = halfLen - i
        
        if i < iMax && temporaryNums2[j - 1] > temporaryNums1[i] {
            iMin = i + 1 // i is too small
        } else if i > iMin && temporaryNums1[i - 1] > temporaryNums2[j] {
            iMax = i - 1 // i is to big
        } else { // i is perfect
            var maxLeft = 0
            if i == 0 {
                maxLeft = temporaryNums2[j - 1]
            } else if j == 0 {
                maxLeft = temporaryNums1[i - 1]
            } else {
                maxLeft = max(temporaryNums1[i - 1], temporaryNums2[j - 1])
            }
            
            if (m + n) % 2 == 1 {
                return Double(maxLeft)
            }
            
            var minRight = 0
            if i == m {
                minRight = temporaryNums2[j]
            } else if j == n {
                minRight = temporaryNums1[i]
            } else {
                minRight = min(temporaryNums2[j], temporaryNums1[i])
            }
            
            return Double((maxLeft + minRight)) / 2.0
        }
    }
    
    return 0.0
}
