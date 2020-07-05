//
//  Naver_Intern_2.swift
//  AlgorithmSwift
//
//  Created by Jinwoo Kim on 16/09/2019.
//  Copyright © 2019 Jinuman. All rights reserved.
//

import Foundation

class Naver_Intern_2 {
    
    func solution(_ S: inout String) -> String {
        let numbers: String = S.split(separator: " ").joined().split(separator: "-").joined()
        let size = numbers.count
        var result = ""
        
        for i in (0 ..< size) {
            /*
             size % 3 == 1 인 경우에 끝에 2-2 형태가 올 수 있다.
             그러므로 이런 형태와 아닌 형태를 분기시키면 될 것 같다는 생각을 했다.
             */
            
            result += numbers[i]
            
            if size % 3 == 1 {  // ex. 7일 경우 3-2-2 가 되야 한다.
                
                if size - 3 == i {  // 끝 처리
                    result += "-"
                    continue
                }
                
                if i % 3 == 2 && size - 2 != i {  // 3자리 뒤 & 마지막 경우의 수가 아닐 경우
                    result += "-"
                }
            } else {
                if size - 1 == i {  // 끝에 '-' 오는 것 방지
                    break
                }
                
                if i % 3 == 2 {
                    result += "-"
                }
            }
        }
        
        return result
    }
    
    func run() {
        var testString1 = "00-44   48   5555   8361"
        var testString2 = "0  -  22 1985  --- 324"
        var testString3 = "555372654"
        
        print(self.solution(&testString1)) // 004-448-555-583-61
        print(self.solution(&testString2)) // 022-198-53-24
        print(self.solution(&testString3)) // 555-372-654
        
        var test = "   0123 ---   456"
        print(self.solution(&test)) // 012-34-56
    }
}


