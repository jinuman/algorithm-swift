// Bubble Sort

import Foundation

final class BubbleSort {

    let arr: [Int] = [3, 5, 4, 2, 9, 6, 10, 8, 7, 1]
    
    func bubbleSort(arr: [Int]) -> [Int] {
        var newArr: [Int] = arr
        let n: Int = newArr.count
        
        for i in (0 ..< n - 1) {
            for j in (0 ..< n - i - 1) {
                if newArr[j] > newArr[j + 1] {
                    newArr.swapAt(j, j + 1)
                }
            }
        }
        
        return newArr
    }
    
    func run() {
        print(bubbleSort(arr: arr))
        // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    }
}
