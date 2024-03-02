//
//  BinaryHeap.swift
//  
//
//  Created by Aditya Sharma on 03/03/24.
//

import Foundation

public enum HeapType {
    case min
    case max
}

public struct BinaryHeap<T: Comparable> {
    
    private var elements: [T] = []
    private let heapType: HeapType
    
    public init(heapType: HeapType = .min) {
        self.heapType = heapType
    }
    
    public mutating func insert(_ value: T) {
        elements.append(value)
        heapifyUp()
    }
    
    public mutating func extract() -> T? {
        
        guard !elements.isEmpty else { return nil }
        
        elements.swapAt(0, elements.count - 1)
        let dequeued = elements.removeLast()
        heapifyDown()
        return dequeued
    }
    
    public func peek() -> T? {
        return elements.first
    }
    
    private func shouldSwap(_ a: T, _ b: T) -> Bool {
        return heapType == .min ? a < b : a > b
    }
    
    private mutating func heapifyUp() {
        
        var currentIndex = elements.count - 1
        
        while currentIndex > 0 {
            let parentIndex = (currentIndex - 1) / 2
            
            if shouldSwap(elements[currentIndex], elements[parentIndex]) {
                elements.swapAt(currentIndex, parentIndex)
                currentIndex = parentIndex
            } else {
                break
            }
        }
    }
    
    private mutating func heapifyDown() {
        
        var currentIndex = 0
        
        while true {
            let leftChildIndex = 2 * currentIndex + 1
            let rightChildIndex = 2 * currentIndex + 2
            
            var nextIndex = currentIndex
            
            if leftChildIndex < elements.count && shouldSwap(elements[leftChildIndex], elements[nextIndex]) {
                nextIndex = leftChildIndex
            }
            
            if rightChildIndex < elements.count && shouldSwap(elements[rightChildIndex], elements[nextIndex]) {
                nextIndex = rightChildIndex
            }
            
            if nextIndex == currentIndex {
                break
            }
            
            elements.swapAt(currentIndex, nextIndex)
            currentIndex = nextIndex
        }
    }
}
