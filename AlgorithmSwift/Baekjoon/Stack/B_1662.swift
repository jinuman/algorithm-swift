// 압축

/* 문제
 압축되지 않은 문자열 S가 주어졌을 때, 이 문자열중 어떤 부분 문자열은 K(Q)와 같이 압축 할 수 있다.
 K는 한자리 정수이고, Q는 0자리 이상의 문자열이다.
 이 Q라는 문자열이 K번 반복된다는 뜻이다.
 압축된 문자열이 주어졌을 때, 복원된 문자열의 길이 return

 S의 최대 길이는 50

 For example,
 71(9) -> 79 -> 길이 2 return
 74(23) -> 723232323 -> 길이 9 return
 */

/* 풀이
 "(" 라면 스택의 깊이 증가 -> index += 1
    - index에 따라 각각의 배열에 문자열과 문자열의 길이를 기록한다.
 ")" 라면 스택의 깊이 감소 -> index -= 1
    - 이 때 K(Q) 조건에 따라 문자열의 길이를 연산하도록 한다. K는 한자리 정수
    - 연산한 값을 감소된 index에 저장하고 최종적인 값은 index = 0 에 위치하도록 한다.

 시간 복잡도: O(N)
 */

struct B_1662 {
    func solution(_ input: String) -> Int {
        var index = 0 // 스택의 깊이 표현
        var numbers = [[Character]](repeating: [Character](), count: input.count + 1) // K 정수를 파악하는데 사용
        var numberLengths = [Int](repeating: 0, count: input.count + 1)

        for element in input {
            if element == "(" {
                index += 1
            } else if element == ")" {
                index -= 1
                let times: Int = Int(numbers[index].last!.asciiValue! - 48)
                numberLengths[index] += times * numberLengths[numberLengths.index(after: index)]
                numberLengths[index] -= 1 // times로 사용한 정수는 사라지므로

                // index + 1 은 사용했으므로 초기화
                numberLengths[numberLengths.index(after: index)] = 0
                numbers[numbers.index(after: index)] = []
            } else {
                numberLengths[index] += 1
                numbers[index].append(element)
            }
        }
        return numberLengths[0]
    }

    func run() {
        guard let input = readLine() else { return }
        print(solution(input))
    }
}

/*
input
33(562(71(9)))

output
19
*/
