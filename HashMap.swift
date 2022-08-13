//
//  HashSet.swift
//  
//
//  Created by Dariy Kordiyak on 13.08.2022.
//

import Foundation

public class HashMap {

    // MARK: - Properties
    
    private var map: [[Int: Int]]
    private let maxLen = 1000000
    
    // MARK: - Initialization

    public init() {
        map = Array(repeating: [:], count: maxLen)
    }
    
    // MARK: - API
    
    public func put(_ key: Int, _ value: Int) {
        let index = index(from: key)
        let position = positionInBucket(key, index)
        if position < 0 {
            map[index] = [key: value]
        } else {
            var bucketAtIndex = map[index]
            bucketAtIndex[key] = value
            map[index] = bucketAtIndex
        }
    }
    
    public func get(_ key: Int) -> Int {
        let index = index(from: key)
        let position = positionInBucket(key, index)
        guard position >= 0 else {
            return -1
        }
        let bucketAtIndex = map[index]
        return bucketAtIndex[position] ?? -1
    }
    
    public func remove(_ key: Int) {
        let index = index(from: key)
        let position = positionInBucket(key, index)
        guard position >= 0 else {
            return
        }
        var bucketAtIndex = map[index]
        bucketAtIndex.removeValue(forKey: position)
        map[index] = bucketAtIndex
    }
    
    // MARK: - Private
        
    private func index(from key: Int) -> Int {
        return key % maxLen
    }
    
    private func positionInBucket(_ key: Int, _ index: Int) -> Int {
        let positionBucket = map[index]
        guard positionBucket.count != 0 else {
            return -1
        }
        for _ in 0..<positionBucket.count {
            if let targetKeyInBucket = positionBucket.keys.first(where: { $0 == key }) {
                return Int(targetKeyInBucket)
            }
        }
        return -1
    }
    
}

/// Usage:
///
///
let hashMap = HashMap()
print(hashMap.get(3))
hashMap.put(3, 33)
print(hashMap.get(3))
hashMap.remove(3)
print(hashMap.get(3))

