//: Playground - noun: a place where people can play

import UIKit

func countingSort(_ array:[Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let maxElement = array.max() ?? 0
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for element in array {
        countArray[element] += 1
    }
    
    for index in 1..<countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    var sortedArray = [Int](repeating:0, count:array.count)
    for element in array {
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
    }
    return sortedArray
}
let array = [ 10, 9, 8, 7, 1, 2, 7, 3 ]
let a = countingSort(array)
