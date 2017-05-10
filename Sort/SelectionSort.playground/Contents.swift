//: Playground - noun: a place where people can play

import UIKit


func selectionSort<T:Comparable>(_ array:inout [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    for i in 0..<array.count {
        var temp = i
        for j in i+1..<array.count {
            if array[j] < array[temp] {
                temp = j
            }
        }
        (array[i], array[temp]) = (array[temp], array[i])
    }
    return array
}

var array = [8, 45, 7, 3, 2, 66, 32, 87, 23, 31, 0, -1]
selectionSort(&array)
