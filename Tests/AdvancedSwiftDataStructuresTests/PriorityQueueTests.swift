//
//  PriorityQueueTests.swift
//  
//
//  Created by Aditya Sharma on 03/03/24.
//

import XCTest
@testable import AdvancedSwiftDataStructures

final class PriorityQueueTests: XCTestCase {
    
    func testEnqueueDequeue() {
        
        var priorityQueue = PriorityQueue<Int>(comparator: <)
        
        XCTAssertTrue(priorityQueue.isEmpty)
        XCTAssertEqual(priorityQueue.count, 0)
        
        priorityQueue.enqueue(3)
        priorityQueue.enqueue(1)
        priorityQueue.enqueue(4)
        
        XCTAssertFalse(priorityQueue.isEmpty)
        XCTAssertEqual(priorityQueue.count, 3)
        XCTAssertEqual(priorityQueue.peek, 1)
        
        XCTAssertEqual(priorityQueue.dequeue(), 1)
        XCTAssertEqual(priorityQueue.count, 2)
        XCTAssertEqual(priorityQueue.peek, 3)
        
        XCTAssertEqual(priorityQueue.dequeue(), 3)
        XCTAssertEqual(priorityQueue.count, 1)
        XCTAssertEqual(priorityQueue.peek, 4)
        
        XCTAssertEqual(priorityQueue.dequeue(), 4)
        XCTAssertTrue(priorityQueue.isEmpty)
        XCTAssertEqual(priorityQueue.count, 0)
        XCTAssertNil(priorityQueue.peek)
        XCTAssertNil(priorityQueue.dequeue())
    }
    
    func testPeek() {
        
        var priorityQueue = PriorityQueue<String>(comparator: >)
        
        XCTAssertTrue(priorityQueue.isEmpty)
        XCTAssertNil(priorityQueue.peek)
        
        priorityQueue.enqueue("apple")
        XCTAssertEqual(priorityQueue.peek, "apple")
        
        priorityQueue.enqueue("banana")
        XCTAssertEqual(priorityQueue.peek, "banana")
        
        priorityQueue.enqueue("orange")
        XCTAssertEqual(priorityQueue.peek, "orange")
    }
    
    func testComplexOperations() {
        
        var priorityQueue = PriorityQueue<Double>(comparator: <)
        
        priorityQueue.enqueue(3.14)
        priorityQueue.enqueue(2.71)
        priorityQueue.enqueue(1.62)
        priorityQueue.enqueue(4.2)
        priorityQueue.enqueue(5.0)
        
        XCTAssertEqual(priorityQueue.dequeue(), 1.62)
        XCTAssertEqual(priorityQueue.dequeue(), 2.71)
        
        priorityQueue.enqueue(3.33)
        
        XCTAssertEqual(priorityQueue.dequeue(), 3.14)
        XCTAssertEqual(priorityQueue.dequeue(), 3.33)
        XCTAssertEqual(priorityQueue.dequeue(), 4.2)
        XCTAssertEqual(priorityQueue.dequeue(), 5.0)
        
        XCTAssertTrue(priorityQueue.isEmpty)
        XCTAssertNil(priorityQueue.peek)
        XCTAssertNil(priorityQueue.dequeue())
    }
    
    static var allTests = [
        ("testEnqueueDequeue", testEnqueueDequeue),
        ("testPeek", testPeek),
        ("testComplexOperations", testComplexOperations),
    ]
}

