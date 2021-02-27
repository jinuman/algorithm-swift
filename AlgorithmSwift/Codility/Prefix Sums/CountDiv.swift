// Lesson 04 : Prefix Sums

/*
 given three integers A, B and K, returns the number of integers within the range [A..B] that are divisible by K
 { i : A ≤ i ≤ B, i mod K = 0 }
 * A and B are integers within the range [0..2,000,000,000]
 * K is an integer within the range [1..2,000,000,000];
 * A ≤ B.

 A 와 B 사이에 K로 나누어 떨어지는 숫자의 개수 return
 */

/*
 시간 복잡도: O(1)
 */

struct CountDiv {
    /// 50% = O(N)
    func solution(_ A: Int, _ B: Int, _ K: Int) -> Int {
        var answer = 0
        for i in stride(from: A, through: B, by: 1) {
            if i % K == 0 {
                answer += 1
            }
        }
        return answer
    }

    /// 100% = O(1)
    func efficientSolution(_ A: Int, _ B: Int, _ K: Int) -> Int {
        if A == 0 { // A 가 0이면, B 를 K 로 나눈 몫에 1을 더해준다.
            return B / K + 1
        } else {
            /*
             A 가 0이 아니면, B 전에 나오는 K 의 배수에서 A 이전에 나오는 K 의 배수들을 뺀다.
             (B / K + 1) - ((A - 1) / K + 1)
             위 식에서 소거하면 (B - A + 1) / K 이지만, 이 계산법은 4 / 3 = 1 인 계산법에서는 성립하지 않는다.
             그러므로 위에서는 1만 소거해야 한다.
             */
            return B / K - (A - 1) / K
        }
    }

    func run() {
        print(efficientSolution(6, 11, 2)) // 3
        print(efficientSolution(0, 11, 2)) // 6
        print(efficientSolution(0, 0, 2)) // 1
        print(efficientSolution(11, 345, 17)) // 19
    }
}
