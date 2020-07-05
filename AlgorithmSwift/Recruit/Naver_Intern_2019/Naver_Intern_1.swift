//
//  Naver_Intern_1.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 16/09/2019.
//  Copyright © 2019 Jinuman. All rights reserved.
//

import Foundation

class Naver_Intern_1 {
    
    func solution(_ A: inout [Int]) -> Int {
        var listSize = 1            // 처음이 -1 일 경우 1
        var currentValue = A[0]
        
        guard currentValue != -1 else { return listSize }
        
        while true {
            listSize += 1
            if A[currentValue] == -1 {
                break
            }
            currentValue = A[currentValue]
        }
        
        return listSize
    }
    
    func run() {
        var testArray1 = [1, 4, -1, 3, 2]
        print(self.solution(&testArray1))  // 4
    }
}
