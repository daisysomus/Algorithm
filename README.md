# 排序算法

## 排序算法时间复杂度和各项属性对比

名称 | 时间复杂度-最好 | 时间复杂度-最差 | 时间复杂度-平均 | 额外空间 | 稳定性 | 原地
---- | ---- | ---- | ---- | ---- | ---- | ---- 
冒泡排序 | O( n^2 ) | O( n^2 ) | O( n^2 ) | O(1) | 是 | 是
选择排序 | O( n^2 ) | O( n^2 ) | O( n^2 ) | O(1) | 是 | 是
插入排序 | O( n ) | O( n^2 ) | O( n^2 ) | O(1) | 是 | 是
希尔排序 | O( nlog(n) ) | O( n^2 ) | O(n log^2 n) | O(1) | 否 | 是
快速排序 | O( nlog(n) ) | O( n^2 ) | nlog(n) | O(1) | 否 | 是
归并排序 | O( nlog(n) | O( nlog(n) | O( nlog(n) | O(n) | 是 | 否
堆排序 | O( nlog(n) | O( nlog(n) | O( nlog(n) | O(1) | 否 | 是
计数排序 | O( n+k ) | O( n+k ) | O( n+k ) | O(n + k) | 是 | 否
基数排序 | O( k * n ) | O( k * n ) | O( k * n ) | O(n + k) | 是 | 否

## 总结

把总结放在前面是方便大家进行查看，了解每个排序算法的特点。

除计数排序和基数排序之外，其他的七种排序算法都是比较排序。比较排序的时间下限是 `O( nlog(n) )`。对于计数和级数排序来说，时间复杂度是线性的，这两个算法都不需要比较，但是它们只能用于整数的排序。

冒泡排序是最简单的排序算法。通过对比的方式将最大（最小）的元素沉（浮）到最下（最上）面。在任何情况下，冒泡排序的时间复杂度都是 `O( n^2 )`，这基本上也是所有比较排序算法最差时的表现了。所以在实际中很少使用冒泡排序。

选择排序和插入排序都是在冒泡排序的基础上做的改进。虽然他们并没有改变排序的时间复杂度，但是他们减少了排序时对比和交换的次数。选择排序是每次都选择剩下未排序元素中最大的放在正确地位置，与冒泡排序相比，它少了中间的交换过程，只需要在最后将它和对应位置上的元素交换即可。插入排序是将元素插入到已排序好的数组中，对插入的过程进行改进的话，可以让交换变得更少。另外，插入排序在最好情况下可以达到 O(n) 的线性时间。

希尔排序是在插入排序的基础上做的改进。在插入排序中，元素每次只能移动一步，希尔排序就是利用步长的概念来提高排序算法的效率。给定一个步长，对步长之间的元素利用插入排序进行排序，然后逐步地减少步长，直到步长为 1，最后再进行一次插入排序，这时候，大部分的数据都已经有序了，插入排序就变得更快了。有一点要注意的是，希尔排序不是稳定的排序，它会改变相同元素之间的相对位置。

快速排序、归并排序和堆排序都是平均时间复杂度为 `O( nLog(n) )` 的算法。归并排序和堆排序在任何时候都是 `O( nLog(n) )`，但快速排序不是，在最差的时候，快速排序可以到 `O( n^2 )`。

快速排序的思想是利用`轴`来元素分成两部分，分完之后，剩下的一个位置就是`轴`所在的位置。所以`轴`的选择就变得至关重要了，一个好的`轴`可以让算法的效率提升，不好的`轴`则会降低算法的效率。

归并排序则是*分治法* 的典型应用。它是将一大堆未排序的元素分成小的已排序的数据，然后再将他们进行合并以得到一个大的已排序的数组。

堆排序是利用了堆的特性：最大（最小）的元素总是在第一个，来对数据进行排序。


## 冒泡排序

从第一个元素开始，将它与下一个元素进行比较，如果第一个元素比第二个元素大，那么交换它们的位置。然后再比较第二个和第三个元素，依此类推。在完成第一轮的比较之后，最大的元素会移动到数组的最后，然后进入下一个循环，但此次不需要再对比最后一个元素了。重复这个过程，直到所有的元素都是有序的。

冒泡排序在任何情况下都要进行 n^2 次比较，所以它不是一个好的排序算法，一般只作为算法的基础来进行了解，实际中也很少会用冒泡排序来解决问题。

冒泡排序是一个稳定的算法，也不需要额外的空间。

```Swift
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
```

## 选择排序

选择数组中最小的一个元素，将它与第一个元素交换。然后再从剩下的元素中选择一个最小的，与第二个元素进行交换。依此类推，直到遍历完整个数组。

选择排序不需要额外的空间，同时也是一个原地算法。但是在任何情况下，选择排序的时间复杂度都是 **O( n^2**。虽然选择排序与冒泡排序的时间复杂度是相同的，但是它比冒泡排序要好在不用进行多次交换，这节省了一些时间。

```Swift
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
```

## 插入排序

核心思想是将已新数据插入到有序的数组中。刚开始的时候，有序数组是空的，把待排序的第一个元素放到有序数组里时，有序数组就有元素了。然后再依次将数组中的其他元素插入到有序数组中。

在插入的过程中，为了减少交换的次数，如果需要插入的元素比当前对比的元素小时，直接将与之对比的元素往后挪动，这样可以减少交换元素的次数。

以上过程可以在同一个数组里完成，而不需要额外的空间。插入排序也是一个原地算法。

```Swift
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
```

## 希尔排序

希尔排序是在插入排序的基础上做的改进。希尔排序通过将数组中部分元素逐步地变成有序的来提高插入排序的效率。希尔排序是通过设置步长的方式让元素可以一次移动较长的距离来减少元素的移动次数来达到比插入排序更好的效果的。

首先设置一个初始的步长，将数组依据步长来分成多个子系列，然后对每个子系列进行插入排序。然后再逐步减小步长来使更多的数据变得有序，到步长为 1 的时候，执行最后一次插入排序。这时候插入排序的效率会大大提升，因为数据中大部分数据都已经是有序的了。

```Swift
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
```

## 快速排序

选择一个数作为基准，将所有小于基准的数都放到左边，大于基准的数放到右边。然后再递归地对基准左右两边的数据进行同样的计算，直到最后数组变成有序。

快速排序中，选择基准是很重要的。基准选的好的话可以大大减少对比和交换的次数。虽然快速排序在最差的时候可以到 O( n^2 )，但是这个的概率非常低，快速排序的平均时间是 O( nlog(n) )。

```Swift
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
```

## 归并排序

归并排序是分治法的典型应用。分治法的字面意思就是*分而治之*，就是把一个复杂的问题分成两个或者更多的相同或相似的子问题。归并排序就是基于这个思想来实现的。

对于一个大数组来说，它是无序的，但是对于单个数据来说，它是有序的，我们只要把有序的数据合并到一起，那么新的数据就还是有序的。

归并排序就是将数据分成一个个的小堆，然后两两合并堆中的数据，最后变成一个大的有序堆。

```Swift
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
```

## 堆排序

利用堆结构的优势来进行快速排序。由于堆结构的根节点本身就是数组的最大或者最小值，由此就可以直接拿到数组的最大值或者最小值。这样可以加快排序过程，但生成堆也需要花费时间。

每次从堆顶拿掉一个元素之后，只需要进行 log(n) 的操作就可以讲第二大或者第二小的元素重新放到堆顶，这比选择排序快多了。

有了堆结构之后，排序就很简单了，下面是代码。

```Swift
extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: (elements.count - 1), to: 0, by: -1) {
            swap(&elements[0], &elements[i])
            shiftDown(0, heapSize: i)
        }
        return elements
    }
}
```

## 计数排序

是一个稳定的线性时间排序算法。使用一个额外的数组 C，C 中的第 i 个元素是待排序数组 A  中值等于 i 的元素的个数。然后根据数组 C 来将 A 中的元素排到正确的位置。

计数排序是通过将数组的值和另一个数组的索引联系起来进行排序，所以一般适用于对整数的排序，因为数组的索引只能是整数。它的时间复杂度是 O(n+k)，n 是待排序数组的大小，k 是待排序数组中的最大元素的值。

如果待排序数组中的最大值比较大的话，计数排序就不太适用了，因为需要的额外空间与最大数相关。如果数据排布比较密集并且最大值不是很大的话，计数排序是一个比较好的选择，因为它只需要线性的时间就可以完成排序，而且不需要比较。

```Swift

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

```

## 基数排序

是一种非比较型整数排序算法。原理是将整数按位数切割成不同的数字，然后按每个位数分别比较。

```Swift
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
```


