//
//  FileHandleIterator.swift
//  WineKit
//
//  Created by David Walter on 11.12.23.
//

import Foundation

public struct FileHandleIterator: IteratorProtocol {
    let fileHandle: FileHandle
    
    init(_ fileHandle: FileHandle) {
        self.fileHandle = fileHandle
    }
    
    public mutating func next() -> UInt8? {
        do {
            return try fileHandle.readByte()
        } catch {
            return nil
        }
    }
}

extension FileHandle: Sequence {
    public func makeIterator() -> FileHandleIterator {
        FileHandleIterator(self)
    }
}
