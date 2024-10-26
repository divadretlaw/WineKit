//
//  DataExtensions.swift
//  WineKit
//
//  Created by David Walter on 25.10.24.
//

import Foundation

extension Data {
    static let null = Data([0x00])
    
    func copyBytes(_ bounds: PartialRangeFrom<Data.Index>) -> Data {
        Data(self[bounds])
    }
    
    func copyBytes(_ bounds: PartialRangeUpTo<Data.Index>) -> Data {
        Data(self[bounds])
    }
    
    func copyBytes(_ bounds: Range<Data.Index>) -> Data {
        Data(self[bounds])
    }
    
    func chunked(size: Int) -> [Data] {
        guard size > 0 else { return [self] }
        var chunks: [Data] = []
        var data = self
        while !data.isEmpty {
            let startIndex = data.startIndex
            let endIndex = startIndex.advanced(by: size)
            if endIndex < data.endIndex {
                chunks.append(data[startIndex..<endIndex])
            } else {
                chunks.append(data)
            }
            data = data.dropFirst(size)
        }
        return chunks
    }
    
    func paddedIndex<T>(_ type: T.Type, from startIndex: Data.Index) -> Data.Index where T: FixedWidthInteger {
        guard
            startIndex < endIndex,
            var padding = self[startIndex...].load(as: T.self)
        else {
            return startIndex
        }
        
        var nextIndex = startIndex
        
        while padding == 0 {
            nextIndex = nextIndex.advanced(by: MemoryLayout<T>.size)
            
            if nextIndex < endIndex {
                padding = self[nextIndex...].load(as: T.self) ?? 0
            } else {
                return nextIndex
            }
        }
        return nextIndex
    }
    
    func paddedOffset<T>(_ type: T.Type, fromByteOffset offset: Int) -> Int where T: FixedWidthInteger {
        guard var padding = load(fromByteOffset: offset, as: T.self) else {
            return offset
        }
        
        var nextOffset = offset
        var nextEndIndex = startIndex.advanced(by: offset).advanced(by: MemoryLayout<T>.size)
        
        while padding == 0 {
            nextOffset.move(by: T.self)
            nextEndIndex = nextEndIndex.advanced(by: 2)
            
            if nextEndIndex < endIndex {
                padding = load(fromByteOffset: nextOffset, as: T.self) ?? 0
            } else {
                return nextOffset
            }
        }
        return nextOffset
    }
    
    func load<T>(fromByteOffset offset: Int = 0, as type: T.Type) -> T? {
        let startIndex = startIndex.advanced(by: offset)
        let endIndex = startIndex.advanced(by: MemoryLayout<T>.size)
        let data = self[startIndex..<endIndex]
        guard data.count == MemoryLayout<T>.size else { return nil }
        return data.withUnsafeBytes { pointer in
            pointer.loadUnaligned(as: T.self)
        }
    }
    
    func loadData(fromByteOffset offset: Int = 0, upToCount: Int) -> Data? {
        let startIndex = startIndex.advanced(by: offset)
        let endIndex = startIndex.advanced(by: upToCount)
        guard endIndex < self.endIndex else {
            return nil
        }
        return self[startIndex..<endIndex]
    }
    
    func loadRawUnicodeString(fromByteOffset offset: Int = 0) -> Data {
        let startIndex = startIndex.advanced(by: offset)
        let chunks = copyBytes(startIndex...).chunked(size: 2)
        var result = Data()
        
        for bytes in chunks {
            if bytes != Data([0x00, 0x00]) {
                result.append(bytes)
            } else {
                break
            }
        }
        
        return result
    }
}
