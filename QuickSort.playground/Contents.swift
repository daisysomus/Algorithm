//: Playground - noun: a place where people can play

import UIKit

func quickSortLomuto<T:Comparable>(_ array:inout [T], low:Int, high:Int) {
    guard low < high else {
        return
    }
    
    let index = partitionLomuto(&array, low: low, high: high)
    quickSortLomuto(&array, low: low, high: index - 1)
    quickSortLomuto(&array, low: index + 1, high: high)
}

func partitionLomuto<T:Comparable>(_ array:inout [T], low:Int, high:Int) -> Int {
    let pivot = array[high]
    
    var i = low
    for j in low..<high {
        if array[j] <= pivot {
            (array[i], array[j]) = (array[j], array[i])
            i += 1
        }
    }
    (array[i], array[high]) = (array[high], array[i])
    return i
}

var list = [ 26, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 8 ]
var start = CFAbsoluteTimeGetCurrent()
quickSortLomuto(&list, low: 0, high: list.count - 1)
var end = CFAbsoluteTimeGetCurrent()
(end - start) * 1000

func quickSortHoare<T:Comparable>(_ array:inout [T], low:Int, high:Int) {
    guard low < high else {
        return
    }
    
    let index = partitionHoare(&array, low: low, high: high)
    quickSortHoare(&array, low: low, high: index)
    quickSortHoare(&array, low: index + 1, high: high)
}

func partitionHoare<T:Comparable>(_ array:inout [T], low:Int, high:Int) -> Int {
    let pivot = array[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while array[j] > pivot
        repeat { i += 1 } while array[i] < pivot
        
        if i < j {
            (array[i], array[j]) = (array[j], array[i])
        } else{
            return j
        }
    }
}


var array = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
start = CFAbsoluteTimeGetCurrent()
quickSortHoare(&array, low: 0, high: list.count - 1)
end = CFAbsoluteTimeGetCurrent()
(end - start) * 1000





