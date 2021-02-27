// Lesson 04 : Prefix Sums

/*
 배열 A의 요소들은 도로상의 차들을 의미
 0: 동쪽으로 여행하는 차
 1: 서쪽으로 여행하는 차
 (P, Q) : P는 동쪽으로 여행하는 차, Q는 서쪽으로 여행하는 차
 0 <= P < Q < N 조건을 만족해야 한다.
 지나가는 차의 pair 의 개수를 return

 For example, given:
 A[0] = 0
 A[1] = 1
 A[2] = 0
 A[3] = 1
 A[4] = 1
 then, (0, 1), (0, 3), (0, 4), (2, 3), (2, 4) so return 5
 */

/*
 시간 복잡도: O(N)
 */

struct PassingCars {
    func solution(_ A: inout [Int]) -> Int {
        var zeroCount = 0
        var answer = 0
        for item in A {
            if item == 0 {
                zeroCount += 1
            } else {
                answer += zeroCount * item
                if answer > 1000000000 {
                    answer = -1
                    break
                }
            }
        }
        return answer
    }

    func run() {
        var testA1 = [0, 1, 0, 1, 1]
        print(solution(&testA1)) // 5
    }
}
