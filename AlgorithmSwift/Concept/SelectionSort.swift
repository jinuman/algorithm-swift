// Selection Sort
// O(n^2)
// Array 에서 가장 작은 데이터를 선택, 가장 왼쪽 자리부터 스왑 하는 방식의 정렬 알고리즘이다.


import Foundation

class SelectionSort {
    var arr: [Int] = [3, 5, 4, 2, 9, 6, 10, 8, 7, 1]
    
    func selectionSort(_ arr: inout [Int]) -> [Int] {
        let n: Int = arr.count
        
        for i in (0 ..< n - 1) {
            var min = i
            
            for j in ((i + 1) ..< n) {
                if arr[j] < arr[min] {
                    min = j
                }
            }
            // 기억해놓은 제일 작은 값의 인덱스인 min 과 Outer loop 의 제일 작은 인덱스인 i 를 스왑한다.
            arr.swapAt(min, i)
            // 그러면 왼쪽부터 element 의 최종 위치가 결정된다.
        }
        
        return arr
    }
    
    func run() {
        print(selectionSort(&arr))
        // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    }
}
