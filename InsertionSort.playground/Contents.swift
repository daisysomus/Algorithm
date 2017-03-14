//: Playground - noun: a place where people can play

import UIKit

func insertionSort<T:Comparable>(_ array:inout [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    for i in 1..<array.count {
        
        var y = i
        let temp = array[y]
        while y > 0 && temp < array[y - 1] {
            array[y] = array[y - 1]
            y -= 1
        }
        array[y] = temp
        
    }
    
    return array
}

var array = [8, 45, 7, 3, 2, 66, 32, 87, 23, 31, 0, -1]
insertionSort(&array)
