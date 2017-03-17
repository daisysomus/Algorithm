//: Playground - noun: a place where people can play

import UIKit

// 冒泡排序
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

// 选择排序
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

// 插入排序
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

// 希尔排序
func shellSort<T:Comparable>(_ array:inout [T]){
    guard array.count > 1 else {
        return
    }
    
    var gap = array.count / 2
    
    while gap > 0 {
        
        for index in 0..<gap {
            
            shellInsertionSort(&array, start: index, gap: gap)
        }
        gap = gap / 2
    }
}

func shellInsertionSort<T:Comparable>(_ array:inout[T], start:Int, gap:Int) {
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

// 快速排序
func quickSort<T:Comparable>(_ array:inout [T], low:Int, high:Int) {
    guard low < high else {
        return
    }
    
    let index = partitionSort(&array, low: low, high: high)
    quickSort(&array, low: low, high: index - 1)
    quickSort(&array, low: index + 1, high: high)
}

func partitionSort<T:Comparable>(_ array:inout [T], low:Int, high:Int) -> Int {
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
