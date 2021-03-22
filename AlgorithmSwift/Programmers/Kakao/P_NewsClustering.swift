// 뉴스 클러스터링

/* 문제
 자카드 유사도는 원소의 중복을 허용하는 다중집합에 대해서 확장할 수 있다.
 A = {1, 1, 2, 2, 3}, B = {1, 2, 2, 4, 5} 라고 하면,
 - 다중집합의 교집합: {1, 2, 2}
    - 1: min(2, 1), 2: min(2, 2)
 - 다중집합의 합집합: {1, 1, 2, 2, 3, 4, 5}
    - 1: max(2, 1), 2: max(2, 2)

 입력으로 들어온 두 문자열의 자카드 유사도를 return

 For example,
 str1: "FRANCE", str2: "french" 이면,
 - 두 글자씩 끊어서 다중 집합의 원소로 만든다.
 - 대소문자는 무시핟나.
 ["FR", "RA", "AN", "NC", "CE"], ["FR", "RE", "EN", "NC", "CH"]
 - 교집합: ["FR", "NC"]
 - 합집합: ["FR", "RA", "AN", "NC", "CE", "RE", "EN", "CH"]
 두 문자열의 자카드 유사도는 J("FRANCE", "french") = 2 / 8 = 0.25
 자카드 유사도 값은 0에서 1사이의 실수이므로, 65536을 곱한 후 소수점 아래를 버리고 return (ex. 위에서는 0.25 * 65536 = 16384)

 제한 사항
 - ab+ 가 입력으로 들어오면 ab 만 다중집합의 원소로 남고, b+ 는 버린다.
 - 다중집합이 모두 공집합일 경우 자카드 유사도 1 return
 - 입력으로 들어오는 각 문자열의 길이는 2 <= str.count <= 1000 이다.
 */

/* 풀이
 중복을 허용하지 않았다면, 단순히 Set 을 이용하면 된다.
 하지만 중복에 대한 처리도 해줘야 하므로 원소의 빈도수를 저장하는 weight: [String: Int] dictionary 활용
 */

import Foundation

struct P_NewsClustering {

    func solution(_ str1: String, _ str2: String) -> Int {
        var array1 = [String]()
        var array2 = [String]()

        let multiplier: Int = 65536

        // 두 글자 분리
        for i in 0 ..< str1.count - 1 {
            let first = String(str1[str1.index(str1.startIndex, offsetBy: i)]).uppercased()
            let second = String(str1[str1.index(str1.startIndex, offsetBy: i + 1)]).uppercased()
            if "A" <= first && first <= "Z" && "A" <= second && second <= "Z" {
                array1.append(first + second)
            }
        }
        for i in 0 ..< str2.count - 1 {
            let first = String(str2[str2.index(str2.startIndex, offsetBy: i)]).uppercased()
            let second = String(str2[str2.index(str2.startIndex, offsetBy: i + 1)]).uppercased()
            if "A" <= first && first <= "Z" && "A" <= second && second <= "Z" {
                array2.append(first + second)
            }
        }

        // 두 다중집합이 모두 공집합일 경우
        if array1.isEmpty && array2.isEmpty {
            return multiplier
        }

        // 원소들의 빈도수 저장
        var weight1 = [String: Int]()
        var weight2 = [String: Int]()
        for element in array1 {
            weight1[element] = (weight1[element] ?? 0) + 1
        }
        for element in array2 {
            weight2[element] = (weight2[element] ?? 0) + 1
        }

        let set1 = Set(array1)
        let set2 = Set(array2)

        // 교집합
        let intersection = set1.intersection(set2)
        var interCount = 0
        for element in intersection {
            interCount += min(weight1[element] ?? 0, weight2[element] ?? 0)
        }

        // 합집합
        let union = set1.union(set2)
        var unionCount = 0
        for element in union {
            unionCount += max(weight1[element] ?? 0, weight2[element] ?? 0)
        }
        var answer: Int = 0

        answer = Int(Double(interCount) / Double(unionCount) * 65536)
        return answer
    }

    func run() {
        print(solution("FRANCE", "french")) // 16384
        print(solution("handshake", "shake hands")) // 65536
        print(solution("aa1+aa2", "AAAA12")) // 43690
        print(solution("E=M*C^2", "e=m*c^2")) // 65536
        print(solution("E=M*C^2", "french")) // 0
        print(solution("AAAAA", "ABAAA")) // 24576
    }
}
