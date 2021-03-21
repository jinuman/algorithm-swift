// 가장 큰 정사각형 찾기

/* 문제
 0, 1 로 채워진 표가 있다.
 표에서 1로 이루어진 가장 큰 정사각형을 찾아 넓이를 return

 제한 사항
 - 행과 열의 크기: 1000이하의 자연수
 */

/* 풀이
 정사각형을 찾는 방법
 1. 배열의 [1][1]부터 반복문을 돌린다.
 2. 현재 값이 1일 경우, `좌, 상, 좌상` 값 중 (최소값 + 1) 을 값을 현재 값으로 할당한다.
     - 만약 `좌, 상, 좌상` 값 중 0이 포함되어 있으면 정사각형이 될 수 없고, 현재 값은 1로 할당될 것이다.
 3. 배열을 다 돌리고 가장 큰 값이 가장 큰 정사각형의 변의 길이가 된다.
 */

struct P_FindMaxSquare {
    func solution(_ board: [[Int]]) -> Int {
        // 모든 원소가 0 이라면
        if board.flatMap({ $0 }).allSatisfy({ $0 == 0 }) {
            return 0
        }
        var maxLength = 1 // 가장 큰 정사각형의 변의 길이
        let row = board.count
        let col = board[board.startIndex].count

        if row <= 1 || col <= 1 {
            return 1 // 정사각형이 1밖에 나올 수 없다.
        }
        var memo = board

        for i in stride(from: 1, to: row, by: 1) {
            for j in stride(from: 1, to: col, by: 1) {
                if board[i][j] == 1 {
                    let top = memo[i - 1][j]
                    let left = memo[i][j - 1]
                    let topLeft = memo[i - 1][j - 1]
                    memo[i][j] = min(topLeft, min(top, left)) + 1

                    if memo[i][j] > maxLength {
                        maxLength = memo[i][j]
                    }
                }
            }
        }
        return maxLength * maxLength
    }

    func run() {
        print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])) // 9
        print(solution([[0,0,1,1],[1,1,1,1]])) // 4
        print(solution([[1, 1], [1, 0]])) // 1
        print(solution([[0, 0, 0, 0]])) // 0
        print(solution([[1, 1, 1], [1, 0, 1], [1, 1, 0]])) // 1
    }
}
