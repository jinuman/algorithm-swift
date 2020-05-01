//
//  HandCoding.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 29/09/2019.
//  Copyright © 2019 Jinuman. All rights reserved.
//

import Foundation

class BinarySearch {
    /**
     숫자 100만개가 있다.
     이 때 특정 숫자를 검색하고자 하는 프로그램
     
     O(logN)
     */
    
    let numbers: [Int] = Array((0 ... 1000000))
    
    func binarySearch(for searchValue: Int, array: [Int]) -> Bool {
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            
            let middle: Int = (left + right) / 2
            let middleValue: Int = array[middle]
            
            print("middleValue: \(middleValue), array: [\(array[left]), \(array[right])]")
            
            if middleValue == searchValue {
                print("Found! array[\(middle)]: \(array[middle])")
                return true
            }
            
            if searchValue < middleValue {
                right = middle - 1
            }
            
            if searchValue > middleValue {
                left = middle + 1
            }
        }
        
        return false
    }
    
    func run() {
        binarySearch(for: 30, array: numbers)
    }
}

class LinkedList {
    class Node {
        let value: Int
        var next: Node?
        
        init(value: Int, next: Node?) {
            self.value = value
            self.next = next
        }
    }
    
    func printList(head: Node?) {
        // Initialize
        var currentNode: Node? = head
        
        while currentNode != nil {
            print(currentNode?.value ?? -1)
            currentNode = currentNode?.next
        }
    }
    
    func reverseList(head: Node?) -> Node? {
        var currentNode = head
        var prev: Node?
        var next: Node?
        
        while currentNode != nil {
            next = currentNode?.next  // capture currentNode.next
            currentNode?.next = prev  // currentNode.next = nil
            
            prev = currentNode        // prev = one
            currentNode = next        // currentNode = two
        }
        
        return prev
    }
    
    func run() {
        let three = Node(value: 3, next: nil)
        let two = Node(value: 2, next: three)
        let one = Node(value: 1, next: two)
        
        printList(head: one)  // 1 2 3
        
        let reversedNode: Node? = reverseList(head: one)
        printList(head: reversedNode)  // 3 2 1
    }
}
