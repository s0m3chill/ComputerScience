//
//  HashSet.swift
//  
//
//  Created by Dariy Kordiyak on 13.08.2022.
//

import Foundation

public class HashSet {

    // MARK: - Properties
    
    private var set: [[Int]]
    private let maxLen = 1000000
    
    // MARK: - Initialization

    public init() {
        set = Array(repeating: [], count: maxLen)
    }
    
    // MARK: - API
    
    public func add(_ key: Int) {
        let index = index(from: key)
        let position = positionInSet(key, index)
        guard position < 0 else {
            return
        }
        var bucketAtIndex = set[index]
        bucketAtIndex.append(key)
        set[index] = bucketAtIndex
    }
    
    public func remove(_ key: Int) {
        let index = index(from: key)
        let position = positionInSet(key, index)
        guard position >= 0 else {
            return
        }
        set[index].remove(at: position)
    }
    
    public func contains(_ key: Int) -> Bool {
        let position = positionInSet(key, index(from: key))
        return position >= 0
    }
    
    // MARK: - Private
        
    private func index(from key: Int) -> Int {
        return key % maxLen
    }
    
    private func positionInSet(_ key: Int, _ index: Int) -> Int {
        let positionBucket = set[index]
        guard positionBucket.count != 0 else {
            return -1
        }
        for i in 0..<positionBucket.count {
            if positionBucket[i] == key {
                return i
            }
        }
        return -1
    }
    
}

/// Usage:
///
///
let hashSet = HashSet()
print(hashSet.contains(3))
hashSet.add(3)
print(hashSet.contains(3))
hashSet.remove(3)
print(hashSet.contains(3))

