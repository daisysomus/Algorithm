//: Playground - noun: a place where people can play

import UIKit

func mergeSort<T:Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))

    return merge(leftArray, rightPile:rightArray)
}

func merge<T:Comparable>(_ leftPile:[T], rightPile:[T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [T]()
    
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    return orderedPile
}

let array = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
let start = CFAbsoluteTimeGetCurrent()
let result = mergeSort(array)
let end = CFAbsoluteTimeGetCurrent()
(end - start) * 1000
