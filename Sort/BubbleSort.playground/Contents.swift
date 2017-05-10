//: Playground - noun: a place where people can play

import UIKit


func bubbleSort<T:Comparable>(_ array:inout [T]) -> [T] {
    
    for j in 1..<array.count - 1 {
        for i in 0..<array.count - j {
            if array[i] > array[i+1] {
                (array[i], array[i+1]) = (array[i+1], array[i])
            }
        }
    }
    
    return array
}

var array = [8, 45, 7, 3, 2, 66, 32, 87, 23, 31, 0, -1]

var start = CFAbsoluteTimeGetCurrent()
bubbleSort(&array)
var end = CFAbsoluteTimeGetCurrent()
print("bubble sort time:\(end - start)")

start = CFAbsoluteTimeGetCurrent()
bubbleSort(&array)
end = CFAbsoluteTimeGetCurrent()
print("bubble sort time:\(end - start)")

