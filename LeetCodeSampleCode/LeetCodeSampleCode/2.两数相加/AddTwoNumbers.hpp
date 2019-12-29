//
//  AddTwoNumbers.hpp
//  LeetCodeSampleCode
//
//  Created by HM C on 2019/12/28.
//  Copyright © 2019 CHM. All rights reserved.
//

#ifndef AddTwoNumbers_hpp
#define AddTwoNumbers_hpp

#include <stdio.h>

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x): val(x), next(nullptr) { }
};

class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        if (l1 == nullptr) return l2;
        if (l2 == nullptr) return l1;
        
        int carry = 0;
        int tempResult = 0;
        int val1, val2;
        
        ListNode * resultHead, * resultEnd;
        resultHead = new ListNode(0);
        resultEnd = l1;
        resultHead->next = resultEnd;
        // 重复利用 l1、l2 的内存，节省内存分配所耗费时间
        while (l1 != nullptr || l2 != nullptr) {
            if (l1 != nullptr && l2 != nullptr) {
                val1 = l1->val;
                val2 = l2->val;
                resultEnd = l1;
                l1 = l1->next;
                l2 = l2->next;
            } else if (l1 == nullptr) {
                val1 = 0;
                val2 = l2->val;
                resultEnd->next = l2;
                resultEnd = l2;
                l2 = l2->next;
            } else {
                val2 = 0;
                val1 = l1->val;
                resultEnd->next = l1;
                resultEnd = l1;
                l1 = l1->next;
            }
            
            tempResult = val1 + val2 + carry;
            carry = tempResult / 10;
            resultEnd->val = tempResult % 10;
        }
        
        if (carry > 0) {
            resultEnd->next = new ListNode(carry);
            resultEnd = resultEnd->next;
        }
        
        resultEnd->next = nullptr;
        return resultHead->next;
    }
};

class Solution1  {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        if (l1 == nullptr) return l2;
        if (l2 == nullptr) return l1;
        
        int len1 = 1;
        int len2 = 1;
        ListNode *p = l1;
        ListNode *q = l2;
        
        while (p -> next != nullptr) {
            len1++;
            p = p -> next;
        }
        
        while (q -> next != nullptr) {
            len2++;
            q = q -> next;
        }
        
        if (len1 > len2) {
            for (int i = 1 ; i <= len1 - len2; i++) {
                q->next = new ListNode(0);
                q = q -> next;
            }
        } else {
            for (int i = 1 ; i <= len2 - len1; i++) {
                p->next = new ListNode(0);
                p = p->next;
            }
        }
        
        p = l1;
        q = l2;
        bool count = false; // 记录进位
        ListNode *l3 = new ListNode(-1);
        ListNode *w = l3;
        int i = 0; // 记录相加结果
        
        while (p != nullptr && q != nullptr) {
            i = count + p -> val + q -> val;
            w->next = new ListNode(i % 10);
            count = i >= 10 ? true : false;
            w = w->next;
            
            p = p->next;
            q = q->next;
        }
        
        if (count) { // 若最后还有进位
            w->next = new ListNode(1);
            w = w->next;
        }
        
        return l3->next;
    }
};

class Solution2 {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        if (l1 == nullptr) return l2;
        if (l2 == nullptr) return l1;
        
        ListNode *dummyHead = new ListNode(-1);
        ListNode *moveNode = dummyHead;
        int sum = 0;
        bool carry = false;
        
        while (l1 != nullptr || l2 != nullptr) {
            sum = 0;
            
            if (l1 != nullptr) {
                sum += l1->val;
                l1 = l1->next;
            }
            
            if (l2 != nullptr) {
                sum += l2->val;
                l2 = l2->next;
            }
            
            if (carry) {
                sum++;
            }
            
            moveNode->next = new ListNode(sum % 10);
            moveNode = moveNode->next;
            
            carry = sum >= 10 ? true : false;
        }
        
        if (carry) {
            moveNode->next = new ListNode(1);
            moveNode = moveNode->next;
        }
        
        return dummyHead->next;
    }
};

#endif /* AddTwoNumbers_hpp */
