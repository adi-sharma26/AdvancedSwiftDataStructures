# AdvancedSwiftDataStructures

This repository contains advanced custom data structures implemented in Swift. These data structures are designed to provide additional functionality beyond what is available in the built-in Swift standard library.

## Table of Contents

1. [BinaryHeap](#binaryheap)
2. [PriorityQueue](#priorityqueue)


## [BinaryHeap](#binaryheap)
BinaryHeap is a versatile heap implementation that allows you to choose between a Min Heap or a Max Heap. It provides efficient operations for adding elements and extracting the minimum or maximum value.

### Usage

To use a Min Heap:

```swift

let minHeap = BinaryHeap<Int>()
minHeap.insert(5)
minHeap.insert(3)
minHeap.insert(8)
// Perform operations on minHeap

```

To use a Max Heap:

```swift

let maxHeap = BinaryHeap<Int>(heapType: .max)
maxHeap.insert(5)
maxHeap.insert(3)
maxHeap.insert(8)
// Perform operations on maxHeap

```

## [PriorityQueue](#priorityqueue)
PriorityQueue is a data structure that allows you to enqueue elements with associated priorities. Elements are dequeued based on their priority, providing a flexible and efficient way to manage tasks or items with different levels of importance.

### Usage

```swift

var priorityQueue = PriorityQueue<String, Int>()
priorityQueue.enqueue("Task A", withPriority: 3)
priorityQueue.enqueue("Task B", withPriority: 1)
priorityQueue.enqueue("Task C", withPriority: 2)
// Dequeue items based on priority
let highestPriorityTask = priorityQueue.dequeue()

```

## Contribution
Contributions are welcome! If you have ideas for improvements, additional features, or new data structures, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/unlicense/).
