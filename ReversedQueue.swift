
import Foundation

/// Queue data structure with storing elements in reverse order
///
///
//[0, 0, 0, 0, 0]
//
//4 -> [4, 0, 0, 0, 0]
//3 -> [3, 4, 0, 0, 0]
//1 -> [1, 3, 4, 0, 0]
//1 -> [1, 1, 3, 4, 0]
//2 -> [2, 1, 1, 3, 4]
//5 -> [5, 2, 1, 1, 3]

public struct ReversedQueue {
    
    // MARK: - Properties
    
    private var elements: [Double] = []
    private let size: Int
    
    public var count: Int {
        return elements.count
    }
    
    public var currentElements: [Double] {
        return elements
    }
    
    public subscript(index: Int) -> Double {
        return elements[index]
    }
    
    // MARK: - Initialization
    
    public init(size: Int) {
        self.size = size
        elements = [Double](repeating: 0, count: size)
    }
    
    // MARK: - API
    
    public mutating func add(_ element: Double) {
        elements.removeLast()
        elements.insert(element, at: 0)
    }
        
    public mutating func replace(at index: Int,
                          with newValue: Double) {
        elements[index] = newValue
    }
    
    public mutating func clear() {
        elements = [Double](repeating: 0, count: size)
    }
    
}

/// Usage:
///
///
var revQueue = ReversedQueue(size: 5)
print(revQueue.count)
revQueue.add(1)
revQueue.add(2)
revQueue.add(3)
revQueue.add(4)
revQueue.add(5)
revQueue.add(6)
print(revQueue.currentElements)
revQueue.clear()
print(revQueue.currentElements)

/// Tests:
///
///
final class ReversedQueueTests: XCTestCase {
    
    // MARK: - Properties
    
    let size = 5
        
    // MARK: - Tests
    
    func testArraySize() {
        let reversedQueue = ReversedQueueTests(size: size)
        XCTAssertEqual(reversedQueue.count, size, "ReversedQueue elements count error")
    }
    
    func testInitialConfiguration() {
        let reversedQueue = ReversedQueueTests(size: size)
        for i in reversedQueue.currentElements {
            XCTAssertEqual(i, 0, "ReversedQueue initial configuration error")
        }
    }
    
    func testAddElement() {
        var queuedArray = ReversedQueueTests(size: size)
        reversedQueue.add(1)
        XCTAssertEqual(reversedQueue[0], 1, "ReversedQueue add element error")
        reversedQueue.add(2)
        XCTAssertEqual(reversedQueue[0], 2, "ReversedQueue add element error")
        XCTAssertEqual(reversedQueue[1], 1, "ReversedQueue add element error")
        reversedQueue.add(3)
        reversedQueue.add(4)
        reversedQueue.add(5)
        reversedQueue.add(6)
        XCTAssertEqual(reversedQueue[0], 6, "ReversedQueue add element error")
        XCTAssertEqual(reversedQueue[1], 5, "ReversedQueue add element error")
        XCTAssertEqual(reversedQueue[2], 4, "ReversedQueue add element error")
        XCTAssertEqual(reversedQueue[3], 3, "ReversedQueue add element error")
        XCTAssertEqual(reversedQueue[4], 2, "ReversedQueue add element error")
    }
    
    func testReplaceElement() {
        var reversedQueue = ReversedQueueTests(size: size)
        reversedQueue.add(1)
        reversedQueue.add(2)
        reversedQueue.replace(at: 1, with: 3)
        XCTAssertEqual(reversedQueue[1], 3, "ReversedQueue replace element error")
    }
    
    func testClear() {
        var queuedArray = ReversedQueueTests(size: size)
        reversedQueue.add(1)
        reversedQueue.add(2)
        reversedQueue.clear()
        for i in reversedQueue.currentElements {
            XCTAssertEqual(i, 0, "ReversedQueue clear error")
        }
    }

}
