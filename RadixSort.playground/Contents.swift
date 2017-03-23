//: Playground - noun: a place where people can play

import UIKit

func radixSort(_ array:inout [Int]) {
    let radix = 10
    var done = false
    var digit = 1
    
    while !done {
        
        done = true
        var buckets:[[Int]] = []
        
        for _ in 1...radix {
            buckets.append([])
        }
        
        var index = 0
        for number in array {
            index = number / digit
            buckets[index % radix].append(number)
            if done && index > 0 {
                done = false
            }
        }
        
        var i = 0
        for j in 0..<radix {
            let bucket = buckets[j]
            for number in bucket {
                array[i] = number
                i += 1
            }
        }
        
        digit *= radix
    }
}

var array = [170, 45, 75, 90, 802, 24, 2, 66]

radixSort(&array)
