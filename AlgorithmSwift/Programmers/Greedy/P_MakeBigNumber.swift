// 큰 수 만들기

import Foundation

class P_MakeBigNumber {
    func solution(_ number: String, _ k: Int) -> String {
        let size = number.count - k
        var count = k
        var stack: [String] = []
        
        number.forEach { element in
            while true {
                guard
                    let peek = stack.last,
                    peek < element.description else { break }
                
                if count == 0 { break }
                count -= 1
                
                _ = stack.popLast()
            }
            stack.append(element.description)
        }
        
        return stack.joined()[0 ..< size]
    }
    
    
    func run() {
        print(solution("1924", 2))       // 94
        print(solution("1231234", 3))    // 3234
        print(solution("4177252841", 4)) // 775841
        print(solution("10000", 2))      // 100
    }
}
