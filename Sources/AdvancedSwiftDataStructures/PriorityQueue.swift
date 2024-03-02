//
//  PriorityQueue.swift
//  
//
//  Created by Aditya Sharma on 03/03/24.
//

import Foundation

public struct PriorityQueue<T> {
    
    private var heap: [T]
    private let comparator: (T, T) -> Bool
    
    public init(comparator: @escaping (T, T) -> Bool) {
        self.heap = []
        self.comparator = comparator
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var peek: T? {
        return heap.first
    }
    
    public mutating func enqueue(_ values: T...) {
        values.forEach { value in
            heap.append(value)
            siftUp()
        }
    }
    
    @discardableResult
    public mutating func dequeue() -> T? {
        guard let poppedValue = peek else { return nil }
        let bottom = count - 1
        heap.swapAt(0, bottom)
        heap.removeLast()
        siftDown()
        return poppedValue
    }
    
    public mutating func replace(value: T) -> T? {
        let replacedValue = peek
        heap[0] = value
        siftDown()
        return replacedValue
    }
    
    private func greater(_ i: Int, _ j: Int) -> Bool {
        return comparator(heap[i], heap[j])
    }
    
    private mutating func swap(_ i: Int, _ j: Int) {
        heap.swapAt(i, j)
    }
    
    private mutating func siftUp() {
        
        var node = count - 1
        
        while node > 0 && greater(node, (node + 1) / 2 - 1) {
            swap(node, (node + 1) / 2 - 1)
            node = (node + 1) / 2 - 1
        }
    }
    
    private mutating func siftDown() {
        
        var node = 0
        while (2 * node + 1 < count && greater(2 * node + 1, node))
                || (2 * node + 2 < count && greater(2 * node + 2, node)) {
            
            let maxChild = (2 * node + 2 < count
                            && greater(2 * node + 2, 2 * node + 1)) ? 2 * node + 2 : 2 * node + 1
            swap(node, maxChild)
            node = maxChild
        }
    }
}
