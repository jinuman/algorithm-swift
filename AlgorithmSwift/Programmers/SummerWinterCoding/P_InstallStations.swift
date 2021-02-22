// 기지국 설치
// 2018년

/*
 기존에 설치된 첫번째 기지국 왼쪽에 추가로 설치해야 하는 개수
 기존에 설치된 기지국과 기지국 사이에 추가로 설치해야 하는 개수
 기존에 설치된 마지막 기지국 오른쪽에 추가로 설치해야 하는 개수
 */

import Foundation

final class P_InstallStations {
    func stationsToInstall(_ start: Int, _ end: Int, _ w: Int) -> Int {
        var count = 0
        let length = end - start + 1
        let range = w * 2 + 1
        while count * range < length {
            count += 1
        }
        return count
    }

    func stationLeftNoWave(_ station: Int, _ w: Int) -> Int {
        return station - w - 1
    }

    func stationRightNoWave(_ station: Int, _ w: Int) -> Int {
        return station + w + 1
    }

    func  solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
        var answer = 0
        // 첫번째 기지국 왼쪽에 추가로 설치
        if stationLeftNoWave(stations[0], w) >= 1 {
            answer += stationsToInstall(1, stationLeftNoWave(stations[0], w), w)
        }
        // 기지국 사이에 추가로 설치
        for i in stride(from: 1, to: stations.count, by: 1) {
            answer += stationsToInstall(
                stationRightNoWave(stations[i - 1], w),
                stationLeftNoWave(stations[i], w), w
            )
        }
        // 마지막 기지국 오른쪽에 추가로 설치
        if stationRightNoWave(stations[stations.count - 1], w) <= n {
            answer += stationsToInstall(stationRightNoWave(stations[stations.count - 1], w), n, w)
        }
        return answer
    }

    func run() {
        print(solution(11, [4, 11], 1)) // 3
        print(solution(16, [9], 2)) // 3
    }
}
