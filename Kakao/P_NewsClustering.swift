// 뉴스 클러스터링

import Foundation

class P_NewsClustering {
    func solution(_ str1: String, _ str2: String) -> Int {
        var arr1 = [String]()
        var arr2 = [String]()

        // 두 글자 분리
        for i in 0..<str1.count - 1 {
            let first = String(str1[str1.index(str1.startIndex, offsetBy: i)]).uppercased()
            let second = String(str1[str1.index(str1.startIndex, offsetBy: i + 1)]).uppercased()
            if "A" <= first && first <= "Z" && "A" <= second && second <= "Z" {
                arr1.append(first + second)
            }
        }
        for i in 0..<str2.count - 1 {
            let first = String(str2[str2.index(str2.startIndex, offsetBy: i)]).uppercased()
            let second = String(str2[str2.index(str2.startIndex, offsetBy: i + 1)]).uppercased()
            if "A" <= first && first <= "Z" && "A" <= second && second <= "Z" {
                arr2.append(first + second)
            }
        }

        // 예외처리
        var bothEmpty: Bool = false
        if arr1.count == 0 && arr2.count == 0 {
            bothEmpty = true
        }

        // 두 글자 빈도수 저장
        var weight1 = [String:Int]()
        var weight2 = [String:Int]()
        for element in arr1 {
            weight1[element] = (weight1[element] ?? 0) + 1
        }
        for element in arr2 {
            weight2[element] = (weight2[element] ?? 0) + 1
        }

        let set1 = Set(arr1)
        let set2 = Set(arr2)

        // 교집합
        let intersection = set1.intersection(set2)
        var interNum = 0
        for str in intersection {
            interNum += min(weight1[str] ?? 0, weight2[str] ?? 0)
        }

        // 합집합
        let union = set1.union(set2)
        var unionNum = 0
        for str in union {
            unionNum += max(weight1[str] ?? 0, weight2[str] ?? 0)
        }

        var answer: Int = 0
        guard bothEmpty == false else { return 65536 }
        answer = Int(Double(interNum) / Double(unionNum) * 65536)
        return answer
    }

    func run() {
        print(solution("FRANCE", "french"))         // 16384
        print(solution("handshake", "shake hands")) // 65536
        print(solution("aa1+aa2", "AAAA12"))        // 43690
        print(solution("E=M*C^2", "e=m*c^2"))       // 65536
    }
}