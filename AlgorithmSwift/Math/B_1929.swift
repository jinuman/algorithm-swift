// 소수 구하기

/* 문제
 M이상 N이하의 소수를 모두 출력하는 프로그램을 작성하시오.
 */

/* 에라토스테네스의 체
 1. 범위의 isPrime Bool 타입 배열을 만들고 true 로 초기화한다.
 2. 0번, 1번방을 false 로 하고, true 인 수 중 가장 작은 수를 찾는다.
 3. 그 수는 이제 소수이다.
 4. 이제 그 수의 배수는 모두 소수가 아니다.
 */

import Foundation

final class B_1929 {
    private func eratosthenes(maxNumber: Int) -> [Bool] {
        var isPrimeList = [Bool].init(repeating: true, count: maxNumber + 1)

        for i in stride(from: 0, through: maxNumber, by: 1) {
            if i == 0 || i == 1 {
                isPrimeList[0] = false
                isPrimeList[1] = false
            }
            if isPrimeList[i] {
                for j in stride(from: i + i, through: maxNumber, by: i) {
                    isPrimeList[j] = false
                }
            }
        }
        return isPrimeList
    }

    func run() {
        guard let line = readLine()?.components(separatedBy: " ") else { return }
        let inputs = line.compactMap { Int($0) }

        let minNumber: Int = inputs[0]
        let maxNumber: Int = inputs[1]
        
        let isPrimeList: [Bool] = self.eratosthenes(maxNumber: maxNumber)
        
        for i in stride(from: minNumber, through: maxNumber, by: 1) {
            if isPrimeList[i] {
                print(i)
            }
        }
    }
}

/*
input
3 16

output
3
5
7
11
13
*/
