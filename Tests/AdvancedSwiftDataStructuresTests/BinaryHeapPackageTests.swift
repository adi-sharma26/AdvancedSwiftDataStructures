//
//  BinaryHeapPackageTests.swift
//  
//
//  Created by Aditya Sharma on 03/03/24.
//

import XCTest
@testable import AdvancedSwiftDataStructures

final class BinaryHeapPackageTests: XCTestCase {
    
    // MARK: - Min Heap
    
    func testMinHeap() {
        
        var minHeap = BinaryHeap<Int>(heapType: .min)
        minHeap.insert(5)
        minHeap.insert(3)
        minHeap.insert(8)
        minHeap.insert(1)
        
        XCTAssertEqual(minHeap.peek(), 1)
        
        let extracted = minHeap.extract()
        XCTAssertEqual(extracted, 1)
        XCTAssertEqual(minHeap.peek(), 3)
    }
    
    // MARK: - Max Heap
    
    func testMaxHeap() {
        
        var maxHeap = BinaryHeap<Int>(heapType: .max)
        maxHeap.insert(5)
        maxHeap.insert(3)
        maxHeap.insert(8)
        maxHeap.insert(1)
        
        XCTAssertEqual(maxHeap.peek(), 8)
        
        let extracted = maxHeap.extract()
        XCTAssertEqual(extracted, 8)
        XCTAssertEqual(maxHeap.peek(), 5)
    }
    
    static var allTests = [
        ("testMinHeap", testMinHeap),
        ("testMaxHeap", testMaxHeap),
    ]
}

