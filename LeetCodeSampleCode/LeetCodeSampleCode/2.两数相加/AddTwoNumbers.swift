//
//  AddTwoNumbers.swift
//  LeetCodeSampleCode
//
//  Created by HM C on 2019/12/28.
//  Copyright © 2019 CHM. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        let dummyHead = ListNode(0)
        var tempL1 = l1
        var tempL2 = l2
        var decimal = 0 // 用来记录进位的值
        var curr = dummyHead
        
        while tempL1 != nil || tempL2 != nil {
            let l1Val = tempL1 != nil ? tempL1!.val : 0
            let l2Val = tempL2 != nil ? tempL2!.val : 0
            
            let sum = decimal + l1Val + l2Val
            decimal = sum / 10
            
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            
            if tempL1 != nil { tempL1 = tempL1?.next }
            if tempL2 != nil { tempL2 = tempL2?.next }
        }
        
        if decimal > 0 {
            curr.next = ListNode(decimal)
        }
        
        return dummyHead.next
    }
}

class Solution1 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil { return l2 }
        if l2 == nil { return l1 }
        
        var sumArray = [Int]()
        
        var tempL1 = l1
        var tempL2 = l2
        
        while tempL1 != nil || tempL2 != nil {
            let l1Val = tempL1 != nil ? tempL1!.val : 0
            let l2Val = tempL2 != nil ? tempL2!.val : 0
            
            sumArray.append(l1Val + l2Val)
            
            tempL1 = tempL1?.next
            tempL2 = tempL2?.next
        }
        
        var decimal = 0
        let dummyHead = ListNode(0)
        var current = dummyHead
        
        for sum in sumArray {
            current.next = ListNode((sum + decimal) % 10)
            current = current.next!
            
            decimal = (sum + decimal) / 10
        }
        
        if decimal > 0 {
            current.next = ListNode(decimal)
        }
        
        return dummyHead.next
    }
}

class Solution2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: ListNode? = nil;
        
        if l1 == nil && l2 == nil {
            return result
        }
        
        var h1 = l1
        var h2 = l2
        var sum = (h1?.val ?? 0) + (h2?.val ?? 0)
        
        if sum >= 10 {
            sum = sum % 10
            
            h1 = h1?.next ?? ListNode(0)
            
            h1!.val = h1!.val + 1 // 用 h1 的 val 记录进位
        } else {
            h1 = h1?.next
        }
        
        result = ListNode(sum)
        h2 = h2?.next
        result!.next = addTwoNumbers(h1, h2)
        
        return result
    }
}
