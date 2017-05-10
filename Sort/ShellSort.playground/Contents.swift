//: Playground - noun: a place where people can play

import UIKit

func shellSort<T:Comparable>(_ array:inout [T]){
    guard array.count > 1 else {
        return
    }
    
    var gap = array.count / 2
    
    while gap > 0 {
        
        for index in 0..<gap {
            
            insertionSort(&array, start: index, gap: gap)
        }
        gap = gap / 2
    }
}

func insertionSort<T:Comparable>(_ array:inout[T], start:Int, gap:Int) {
    for i in stride(from: start + gap, to: array.count, by: gap) {
        var pos = i
        let currentValue = array[i]
        
        while pos >= gap && array[pos - gap] > currentValue {
            array[pos] = array[pos - gap]
            pos -= gap
        }
        array[pos] = currentValue
    }
}

var array = [64, 20, 50, 21, 72, 10, 23, -1, 4]
shellSort(&array)
