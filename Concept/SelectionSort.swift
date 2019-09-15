// Selection Sort
// O(N^2)


import Foundation

class SelectionSort {
    let arr: [Int] = [3, 5, 4, 2, 9, 6, 10, 8, 7, 1]
    
    func selectionSort(arr: [Int]) -> [Int] {
        var newArr: [Int] = arr
        let n: Int = newArr.count
        
        var min: Int = 0
        
        for i in (0 ..< n - 1) {
            min = i
            
            for j in ((i + 1) ..< n) {
                if newArr[j] < newArr[min] {
                    min = j
                }
            }
            // 기억해놓은 제일 작은 값의 인덱스인 min 과 Outer loop 의 제일 작은 인덱스인 i 를 스왑한다.
            newArr.swapAt(min, i)
            // 그러면 왼쪽부터 element 의 최종 위치가 결정된다.
        }
        
        return newArr
    }
    
    func run() {
        print(selectionSort(arr: arr))
        // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    }
}
