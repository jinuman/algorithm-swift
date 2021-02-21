//
//  JobFair_Anagram.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 2020/07/05.
//  Copyright © 2020 Jinuman. All rights reserved.
//

// 1번 문제

import Foundation

struct JobFair_Anagram {
    
    func solution(a: String, b: String) -> Bool {
        
        let lowercasedA: String = a.lowercased()
        let lowercasedB: String = b.lowercased()
        
        let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
        
        var arrayA = [Int].init(repeating: 0, count: alphabets.count)
        var arrayB = [Int].init(repeating: 0, count: alphabets.count)
        
        for ch in lowercasedA {
            guard let index = alphabets.firstIndex(of: ch) else { break }
            arrayA[index] += 1
        }
        
        for ch in lowercasedB {
            guard let index = alphabets.firstIndex(of: ch) else { break }
            arrayB[index] += 1
        }
        
        for i in (0 ..< alphabets.count) {
            if arrayA[i] != arrayB[i] {
                return false
            }
        }
        return true
    }
    
    func run() {
        print(solution(a: "listen", b: "silent"))    // true
        print(solution(a: "anagram", b: "MARGANA"))  // true
    }
}
