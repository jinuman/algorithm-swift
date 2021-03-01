// DFS와 BFS

/* 문제
 그래프를 DFS로 탐색한 결과와 BFS로 탐색한 결과를 출력하는 프로그램을 작성하시오.
 단, 방문할 수 있는 정점이 여러 개인 경우에는 정점 번호가 작은 것을 먼저 방문하고,
 더 이상 방문할 수 있는 점이 없는 경우 종료한다.
 정점 번호는 1번부터 N번까지이다.

 정점의 개수 N(1 <= N <= 1,000), 간선의 개수(1 <= M <= 10,000), 탐색을 시작할 정점의 번호가 주어진다.
 그 다음 M개의 줄에 간선이 연결하는 두 정점의 번호가 주어진다.

 DFS를 수행한 결과 return
 BFS를 수행한 결과 return
 */

import Foundation

final class B_1260 {
    var graph = [[Int]]()
    var visit = [Bool]()

    func run() {
        guard let line = readLine()?.split(separator: " ") else { return }
        let inputs = line.compactMap { Int($0) }
        let n = inputs[0]
        let m = inputs[1]
        let start = inputs[2]

        graph = [[Int]](repeating: [], count: n + 1)
        visit = [Bool](repeating: false, count: n + 1)

        // 그래프 초기화
        for _ in stride(from: 0, to: m, by: 1) {
            guard let edgeLine = readLine()?.split(separator: " ") else { return }
            let edge: [Int] = edgeLine.compactMap { Int($0) }
            let u = edge[0]
            let v = edge[1]

            graph[u].append(v)
            graph[v].append(u)
        }
        for i in stride(from: 1, through: n, by: 1) {
            graph[i].sort()
        }

        dfs(start)
        print()
        // visit 초기화
        visit = [Bool].init(repeating: false, count: n + 1)
        bfs(start)
        print()
    }
}

extension B_1260 {
    func dfs(_ x: Int) {
        visit[x] = true
        print(x, terminator: " ")
        for i in stride(from: 0, to: graph[x].count, by: 1) {
            let next = graph[x][i]
            if !visit[next] {
                dfs(next)
            }
        }
    }
}

extension B_1260 {
    func bfs(_ start: Int) {
        var queue: [Int] = []
        visit[start] = true
        queue.append(start)
        while !queue.isEmpty {
            let x = queue.removeFirst()
            print(x, terminator: " ")
            for next in graph[x] {
                if !visit[next] {
                    visit[next] = true
                    queue.append(next)
                }
            }
        }
    }
}

/*
input
4 5 1
1 2
1 3
1 4
2 4
3 4

output
1 2 4 3
1 2 3 4
*/
