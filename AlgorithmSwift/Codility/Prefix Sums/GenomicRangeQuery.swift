// Lesson 04 : Prefix Sums

/*
 DNA sequence can be represented as a string consisting of the letters A, C, G, T.
 Each letter has an impact factor A = 1, C = 2, G = 3, T = 4
 What is the minimal impact factor of letters contained in a particular part of given DNA sequence?

 * each element of arrays P, Q is an integer within the range [0...N - 1]
 * P[K] <= Q[K], where 0 <= K < M
 * S consists only of upper-case English letters A, C, G, T.

 For example, given S = CAGCCTA
 P[0] = 2, Q[0] = 4
 P[1] = 5, Q[1] = 5
 P[2] = 0, Q[2] = 6

 then,
 0: 2 ~ 4 is GCC so answer is 2
 1: 5 ~ 5 is T so answer is 4
 2: 0 ~ 6 is CAGCCTA so answer is 1
 so, return [2, 4, 1]
 */

/*
 시간 복잡도: O(N + M)
 */

struct GenomicRangeQuery {
    func solution(_ S: inout String, _ P: inout [Int], _ Q: inout [Int]) -> [Int] {
        var answer = [Int](repeating: 0, count: P.count)
        var countA = [Int](repeating: 0, count: S.count + 1)
        var countC = [Int](repeating: 0, count: S.count + 1)
        var countG = [Int](repeating: 0, count: S.count + 1)

        for (i, letter) in S.enumerated() {
            countA[i + 1] = countA[i]
            countC[i + 1] = countC[i]
            countG[i + 1] = countG[i]

            switch letter {
            case "A":
                countA[i + 1] += 1
            case "C":
                countC[i + 1] += 1
            case "G":
                countG[i + 1] += 1
            default:
                break
            }
        }
        var p: Int
        var q: Int

        for i in stride(from: 0, to: P.count, by: 1) {
            p = P[i]
            q = Q[i]

            if countA[p] < countA[q + 1] {
                answer[i] = 1
            } else if countC[p] < countC[q + 1] {
                answer[i] = 2
            } else if countG[p] < countG[q + 1] {
                answer[i] = 3
            } else {
                answer[i] = 4
            }
        }
        return answer
    }

    func run() {
        var testS1 = "CAGCCTA"
        var testP1 = [2, 5, 0]
        var testQ1 = [4, 5, 6]
        print(solution(&testS1, &testP1, &testQ1)) // [2, 4, 1]
    }
}
