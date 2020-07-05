//
//  Naver_Intern_3.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 16/09/2019.
//  Copyright © 2019 Jinuman. All rights reserved.
//

import Foundation

class Naver_Intern_3 {
    
    func solution(_ S: inout String) -> Int {
        let splittedList = S.split(separator: ".")
            .joined(separator: "?").split(separator: "?")
            .joined(separator: "!").split(separator: "!")
        
        var maximum = 0
        splittedList.forEach { sentence in
            let words = sentence.split(separator: " ")
            maximum = max(words.count, maximum)
        }
        
        return maximum
    }
    
    func run() {
        var testString1 = "We test coders. Give us a try?"
        var testString2 = "Forget   CVs..Save time  . x x"
        var testString3 = "hello?hi"
        print(self.solution(&testString1))  // 4
        print(self.solution(&testString2))  // 2
        print(self.solution(&testString3))  // 1
    }
}
